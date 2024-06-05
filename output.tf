output "public_ip"{
  value = aws_instance.web[*].public_ip
}

#output "private_ip" {
#  value = aws_instance.web-2.private_ip
#}