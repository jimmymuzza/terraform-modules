resource "aws_vpc_endpoint" "vpc_endpoints" {
  for_each = var.vpc_endpoints

  vpc_id                     = each.value.vpc_id
  auto_accept                = each.value.auto_accept
  ip_address_type            = each.value.ip_address_type
  policy                     = each.value.policy
  private_dns_enabled        = each.value.private_dns_enabled
  region                     = each.value.region
  resource_configuration_arn = each.value.resource_configuration_arn
  route_table_ids            = each.value.route_table_ids
  security_group_ids         = each.value.security_group_ids
  service_name               = each.value.service_name
  service_network_arn        = each.value.service_network_arn
  service_region             = each.value.service_region
  subnet_ids                 = each.value.subnet_ids
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  vpc_endpoint_type          = each.value.vpc_endpoint_type

  dynamic "dns_options" {
    for_each = each.value.dns_options != null ? each.value.dns_options : []
    content {
      dns_record_ip_type                             = dns_options.value.dns_record_ip_type
      private_dns_only_for_inbound_resolver_endpoint = dns_options.value.private_dns_only_for_inbound_resolver_endpoint
      private_dns_preference                         = dns_options.value.private_dns_preference
      private_dns_specified_domains                  = dns_options.value.private_dns_specified_domains
    }
  }

  dynamic "subnet_configuration" {
    for_each = each.value.subnet_configuration != null ? each.value.subnet_configuration : []
    content {
      ipv4      = subnet_configuration.value.ipv4
      ipv6      = subnet_configuration.value.ipv6
      subnet_id = subnet_configuration.value.subnet_id
    }
  }
}
