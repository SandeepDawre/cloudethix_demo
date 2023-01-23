output "SECURITY_GROUP_ID" {
  value = aws_security_group.this_security_group.id
}

output "SECURITY_GROUP_NAME" {
  value = aws_security_group.this_security_group.name
}
