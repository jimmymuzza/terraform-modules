resource "aws_cloudfront_connection_group" "cloudfront_connection_groups" {
  for_each = var.cloudfront_connection_groups

  name                = each.value.name
  anycast_ip_list_id  = each.value.anycast_ip_list_id
  enabled             = each.value.enabled
  ipv6_enabled        = each.value.ipv6_enabled
  tags                = each.value.tags
  wait_for_deployment = each.value.wait_for_deployment
}
