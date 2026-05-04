variable "route53_resolver_firewall_rules" {
  description = <<EOT
Map of route53_resolver_firewall_rules, attributes below
Required:
    - action
    - firewall_rule_group_id
    - name
    - priority
Optional:
    - block_override_dns_type
    - block_override_domain
    - block_override_ttl
    - block_response
    - confidence_threshold
    - dns_threat_protection
    - firewall_domain_list_id
    - firewall_domain_redirection_action
    - q_type
    - region
EOT

  type = map(object({
    action                             = string
    firewall_rule_group_id             = string
    name                               = string
    priority                           = number
    block_override_dns_type            = optional(string)
    block_override_domain              = optional(string)
    block_override_ttl                 = optional(number)
    block_response                     = optional(string)
    confidence_threshold               = optional(string)
    dns_threat_protection              = optional(string)
    firewall_domain_list_id            = optional(string)
    firewall_domain_redirection_action = optional(string)
    q_type                             = optional(string)
    region                             = optional(string)
  }))
}
