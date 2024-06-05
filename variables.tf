variable "region" {
    type = string
    default = "us-west-2"  
}

variable "ami"{
    type = string
    default = "ami-06068bc7800ac1a83"
}

variable "inst-type" {
    type = string
    default = "t2.micro"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "keys/mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "keys/mykey"
}

variable "instance-username"{
    default = "ubuntu"
}

variable "port" {
  type    = list(number)
  default = [22,53,80,443,1521,3306,3389]
}

variable "management-sg" {
  type = map(object({
    description = string
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))

  default = {
    "22" = {
      description = "SSH"
      port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }

    "80" = {
      description = "HTTP"
      port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }

    "443" = {
      description = "HTTPS"
      port = 443
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }

    "1521" = {
      description = "Oracle"
      port = 1521
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }

    "3309" = {
      description = "MySQL"
      port = 3309
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }

    "53" = {
      description = "UDP"
      port = 53
      protocol = "udp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }  
}

variable "users"{
    type = list(string)
    default = [ "Adam", "Eve", "Set" ]
}