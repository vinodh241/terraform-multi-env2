
## Ec2 - instance creation terraform module

resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id] ## it means it will take sg id from mentioned secutirty group

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.instances[count.index]}-${var.environment}",
      component   = var.instances[count.index]
      Environment = var.environment
    }
  )
}

## Below are the Security gropus creation terraform modules

resource "aws_security_group" "allow_all" {
  name        = "${var.project}-${var.sg_name}-${var.environment}"
  description = var.sg_description


  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.sg_name}-${var.environment}"
    }
  )
}