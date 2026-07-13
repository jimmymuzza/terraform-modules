variable "vpc_security_group_rules_exclusives" {
  description = <<EOT
Map of vpc_security_group_rules_exclusives, attributes below
Required:
    - egress_rule_ids
    - ingress_rule_ids
    - security_group_id
Optional:
    - region
EOT

  type = map(object({
    egress_rule_ids   = set(string)
    ingress_rule_ids  = set(string)
    security_group_id = string
    region            = optional(string)
  }))
}
