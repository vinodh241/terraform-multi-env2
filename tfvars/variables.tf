variable "project" {
  default = "roboshop"
}

variable "environment" {
}

variable "common_tags" {
  default = {
    project   = "roboshop"
    Terraform = "true"
  }
}

variable "sg_name" {
  default = "allow-all"
}


variable "sg_description" {
  default = "Allowing all ports from all ip"
}

variable "instances" {
  default = ["mongodb", "redis"]

}

variable "from_port" {
  default = 0

}

variable "to_port" {
  default = 0
  type    = number

}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"

}

variable "instance_type" {
  
}