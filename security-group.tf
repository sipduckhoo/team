data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["giboon-jotta"]
  }
}

//locals {
//  ports = [22,53,80,443,1521,3306,3389]
//} //지역 변수

resource "aws_security_group" "management" {
  name="management"
# vpc_id = "vpc-0e0bd5d99e75d23c8"
  vpc_id = data.aws_vpc.selected.id

  dynamic "ingress" {
    for_each = var.management-sg
    content {
      #description = "description ${ingress.key}"
      description = "${ingress.value.description} + ${ingress.key}"
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

/*
  ingress{ //ingress: inbound라는 뜻
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress{
    from_port = -1 //icmp는 포트가 없기에(포트를 아예 사용하지 않기에) 이런 식으로 사용
    to_port = -1
    protocol = "icmp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1" //모든 프로토콜
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "management-sg"
  }
  */
}