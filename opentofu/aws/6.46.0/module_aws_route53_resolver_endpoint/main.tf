resource "aws_route53_resolver_endpoint" "route53_resolver_endpoints" {
  for_each = var.route53_resolver_endpoints

  direction                          = each.value.direction
  security_group_ids                 = each.value.security_group_ids
  name                               = each.value.name
  protocols                          = each.value.protocols
  region                             = each.value.region
  resolver_endpoint_type             = each.value.resolver_endpoint_type
  rni_enhanced_metrics_enabled       = each.value.rni_enhanced_metrics_enabled
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  target_name_server_metrics_enabled = each.value.target_name_server_metrics_enabled

  dynamic "ip_address" {
    for_each = each.value.ip_address != null ? each.value.ip_address : []
    content {
      subnet_id = ip_address.value.subnet_id
      ip        = ip_address.value.ip
      ipv6      = ip_address.value.ipv6
    }
  }
}
