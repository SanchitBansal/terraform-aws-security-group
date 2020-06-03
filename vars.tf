variable "profile" {
  description = "profile name to get valid credentials of account"
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "ap-south-1"
}

variable "environment" {
  type = "string"
  description = "The name of your environment"
}

variable "name" {
  type = "string"
  description = "Name of the security group"
}

variable "custom_tags" {
  type        = "map"
  default     = {}
  description = "map of tags to be added"
}

variable "vpc_tags" {
  description = "Pair of tags to filter VPC id"
  type        = "map"
}

variable "description" {
  type = "string"
  description = "description of security group"
}

variable "security_rule_egress_cidr" {
  type        = "list"
  default = []

  description = <<EOF
Egress rules of security group where cidr_blocks to be defined. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = ""
  }
]
EOF
}

variable "security_rule_ingress_cidr" {
  type        = "list"
  default = []

  description = <<EOF
Ingress rules of security group where cidr_blocks to be defined. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = ""
  }
]
EOF
}

variable "security_rule_egress_self" {
  default     = []
  type        = "list"

  description = <<EOF
Egress rules of security group for self pointing. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    description = ""
  }
]
EOF
}

variable "security_rule_ingress_self" {
  default     = []
  type        = "list"

  description = <<EOF
Ingress rules of security group for self pointing. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    description = ""
  }
]
EOF
}

variable "security_rule_egress_groupid" {
  type        = "list"
  default     = []

  description = <<EOF
Egress rules of security group where source_security_group_id to be mapped. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    source_security_group_id = "sg-xc7gj8bj"
    description = ""
  }
]
EOF
}

variable "security_rule_ingress_groupid" {
  type        = "list"
  default     = []

  description = <<EOF
Ingress rules of security group where source_security_group_id to be mapped. Following is the example and except description, all the fields are mandatory.

default = [
  {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    source_security_group_id = "sg-xc7gj8bj"
    description = ""
  }
]
EOF
}
