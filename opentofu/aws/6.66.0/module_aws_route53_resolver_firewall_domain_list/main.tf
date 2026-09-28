resource "aws_route53_resolver_firewall_domain_list" "route53_resolver_firewall_domain_lists" {
  for_each = var.route53_resolver_firewall_domain_lists

  name     = each.value.name
  domains  = each.value.domains
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
