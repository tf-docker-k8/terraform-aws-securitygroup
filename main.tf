resource "aws_security_group" "this" {

  name = var.security_group_name
  description = var.security_group_description
  vpc_id = var.vpc_id
  
  dynamic "ingress" { # it will enalbe us an object called ingress
    for_each = var.ingress
    content {
      description = ingress.value.description
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  } 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.security_group_tags
}