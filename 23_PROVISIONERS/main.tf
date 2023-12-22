terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}


resource "aws_key_pair" "this_login_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


resource "aws_instance" "this_ec2_instance" {
   ami = var.ami_id
   instance_type = var.instance_type
   key_name = aws_key_pair.this_login_key.key_name


// REMOTE Provisioner

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = file(var.private_key_path)
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
     "sudo yum install -y httpd",
     "sudo echo 'Hello Cloudethix'>/var/www/html/index.html",
     "sudo systemctl start httpd"
   ]
 }


//Local Provisioner
  provisioner "local-exec" {
    command = "echo ${aws_instance.this_ec2_instance.private_ip} >> /root/private_ips.txt"
  }

//Destroy Time Provisioner
  provisioner "remote-exec" {
       when    = destroy
       inline = [
         "sudo yum remove -y httpd"
       ]
  }

//Handel provisioner Errors
/*
  provisioner "remote-exec" {
     on_failure = continue
     inline = [
       "sudo yum -y install vimmm"
     ]
 }
*/
}