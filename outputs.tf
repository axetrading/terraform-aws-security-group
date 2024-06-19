output "security_group_id" {
  description = "The ID of the security group"
  value       = try(aws_security_group.this[0].id, null)
}

# Output the security group rules for external usage
output "security_group_rules" {
  value = merge(
    { for k, v in local.ingress_rules : k => merge(v, { type = "ingress" }) },
    { for k, v in local.egress_rules : k => merge(v, { type = "egress" }) }
  )
}
