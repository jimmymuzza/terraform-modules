resource "aws_route53_resolver_firewall_rule" "route53_resolver_firewall_rules" {
  for_each = var.route53_resolver_firewall_rules

  action                             = each.value.action
  firewall_rule_group_id             = each.value.firewall_rule_group_id
  name                               = each.value.name
  priority                           = each.value.priority
  block_override_dns_type            = each.value.block_override_dns_type
  block_override_domain              = each.value.block_override_domain
  block_override_ttl                 = each.value.block_override_ttl
  block_response                     = each.value.block_response
  confidence_threshold               = each.value.confidence_threshold
  dns_threat_protection              = each.value.dns_threat_protection
  firewall_domain_list_id            = each.value.firewall_domain_list_id
  firewall_domain_redirection_action = each.value.firewall_domain_redirection_action
  q_type                             = each.value.q_type
  region                             = each.value.region
}
