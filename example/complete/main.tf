provider "aws" {
  region = "eu-west-2"
}

locals {
  security_group_rules = jsondecode(file("${path.module}/security_group_rules.json"))
  rules                = jsondecode(data.aws_s3_object.sg_rules.body)
  additional_ingress_rules = {
    ingress_22 = {
      description = "Allow SSH traffic"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  additional_egress_rules = {
    egress_443 = {
      description = "Allow HTTPS traffic"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "security_group" {
  source                     = "../../"
  create_security_group      = false
  security_group_name        = "example-sg"
  security_group_description = "Example security group"
  vpc_id                     = "vpc-12345678"
  rules_file_path            = "${path.module}/security_group_rules.json"
}

# Example usage when not creating a security group, but using an existing one
module "security_group_existing" {
  source                     = "../../"
  create_security_group      = false
  existing_security_group_id = "sg-12345678"
  load_from_s3               = true
  s3_bucket                  = "ttfi-security-group-rules"
  s3_key                     = "rules/dev/rules.json"
}

output "security_group_rules" {
  value = module.security_group.security_group_rules
}


output "security_group_existing_rules" {
  value = module.security_group_existing.security_group_rules
}
