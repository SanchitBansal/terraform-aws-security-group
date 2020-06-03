# Terraform AWS Security Group Module

Terraform module to create AWS Security Group with multiple options of defining ingress/ egress rules.

**This module requires Terraform <=v0.11.**

Here are the feature list of module:
* Define rule with CIDR blocks.
* Define rule with self reference.
* Define rule with reference of other security group ids.

```hcl
module "mysql-security-group" {
  source             = "github.com/SanchitBansal/terraform-aws-security-group.git?ref=master"
  environment        = "test"
  profile            = "nonprod"
  vpc_tags        = {}

  name               = "githubmysql"
  description        = "githubmysql security group"

  security_rule_egress_cidr = [
    {
      from_port  = "0"
      to_port    = "0"
      protocol   = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  security_rule_egress_self = [
    {
      from_port  = "3306"
      to_port    = "3306"
      protocol   = "tcp"
    },
  ]

  security_rule_ingress_self = [
    {
      from_port  = "3306"
      to_port    = "3306"
      protocol   = "tcp"
    },
  ]

  security_rule_ingress_cidr = [
    {
      from_port  = "22"
      to_port    = "22"
      protocol   = "tcp"
      cidr_blocks = "x.x.x.x/32,y.y.y.y/24"
      description = "allow access from office natted ips"
    },
    {
      from_port  = "3306"
      to_port    = "3306"
      protocol   = "tcp"
      cidr_blocks = "192.168.101.0/24"
      description = "allow mysql access from app subnet"
    },
  ]

  security_rule_ingress_groupid = [
    {
      from_port  = "22"
      to_port    = "22"
      protocol   = "tcp"
      source_security_group_id = "sg-xxxx"
      description = "allow access from bastion server"
    }
  ]

  custom_tags        = {
    service      = "mysql"
    role         = "database"
    businessunit = "techteam"
    organization = "github"
  }
}
```
