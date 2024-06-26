# Define local variables to read and decode the JSON file
locals {
  security_group_rules = var.load_from_s3 ? jsondecode(data.aws_s3_object.rules[0].body) : jsondecode(file(var.rules_file_path))
  ingress_rules        = local.security_group_rules.ingress
  egress_rules         = local.security_group_rules.egress
}


# Conditional creation of the security group
resource "aws_security_group" "this" {
  count       = var.create_security_group ? 1 : 0
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id
}
# Conditional creation of ingress rules
resource "aws_security_group_rule" "ingress" {
  for_each = var.create_security_group && var.create_security_group_rules ? { for k, v in local.ingress_rules : k => v } : {}

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = aws_security_group.this[0].id
}

# Conditional creation of egress rules
resource "aws_security_group_rule" "egress" {
  for_each = var.create_security_group && var.create_security_group_rules ? { for k, v in local.egress_rules : k => v } : {}

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = aws_security_group.this[0].id
}
