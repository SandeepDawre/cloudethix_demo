#########################
#         VPC           #
#########################

// VPC

resource "aws_vpc" "test_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "AWS_3_TIER_VPC"
  }
}

#========================================================

// Subnets
resource "aws_subnet" "public01" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.0.0/18"
  availability_zone = "us-east-2a"

  tags = {
    Name = "public01"
  }
}

resource "aws_subnet" "public02" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.64.0/18"
  availability_zone = "us-east-2b"

  tags = {
    Name = "public02"
  }
}

resource "aws_subnet" "private01" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.128.0/18"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private01"
  }
}

resource "aws_subnet" "private02" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.192.0/18"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private02"
  }
}
// network interface

resource "aws_network_interface" "my-network-interface" {
  subnet_id       = aws_subnet.public01.id
  security_groups = [aws_security_group.web_sg.id]

  attachment {
    instance     = aws_instance.WEB_INSTANCE.id
    device_index = 1
  }
}

// ROUTE TABLE

resource "aws_route_table" "pub_rot_tab1" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "PUBLIC01"
  }
}

resource "aws_route_table" "pub_rot_tab2" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "PUBLIC02"
  }
}

resource "aws_route_table" "pri_rot_tab1" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "PRIVATE01"
  }
}

resource "aws_route_table" "pri_rot_tab2" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "PRIVATE02"
  }
}


// ROUTE

resource "aws_route" "pub_route1" {
  route_table_id         = aws_route_table.pub_rot_tab1.id
  gateway_id             = aws_internet_gateway.AWS_igw.id
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route" "pub_route2" {
  route_table_id         = aws_route_table.pub_rot_tab2.id
  network_interface_id   = aws_network_interface.my-network-interface.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "pri_route1" {
  route_table_id         = aws_route_table.pri_rot_tab1.id
  gateway_id             = aws_nat_gateway.aws_nat.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "pri_route2" {
  route_table_id         = aws_route_table.pri_rot_tab2.id
  network_interface_id   = aws_network_interface.my-network-interface.id
  destination_cidr_block = "0.0.0.0/0"
}

// ELASTIC IP

resource "aws_eip" "aws_eip" {
  domain = "vpc"
}

// ROUTE TABLE ASSOCIATION 

resource "aws_route_table_association" "pub_rot_aso1" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.pub_rot_tab1.id
}

resource "aws_route_table_association" "pub_rot_aso2" {
  subnet_id      = aws_subnet.public02.id
  route_table_id = aws_route_table.pub_rot_tab2.id
}

resource "aws_route_table_association" "pri_rot_aso1" {
  subnet_id      = aws_subnet.private01.id
  route_table_id = aws_route_table.pri_rot_tab1.id
}

resource "aws_route_table_association" "pri_rot_aso2" {
  subnet_id      = aws_subnet.private02.id
  route_table_id = aws_route_table.pri_rot_tab2.id
}

// INTERNET GATEWAY

resource "aws_internet_gateway" "AWS_igw" {
  vpc_id = aws_vpc.test_vpc.id

}

# resource "aws_internet_gateway_attachment" "AWS_igw_att" {
#   internet_gateway_id = aws_internet_gateway.AWS_igw.id
#   vpc_id              = aws_vpc.test_vpc.id
# }

// NAT GATEWAY

resource "aws_nat_gateway" "aws_nat" {
  allocation_id = aws_eip.aws_eip.id
  subnet_id     = aws_subnet.public01.id
}



