resource "aws_networkmanager_customer_gateway_association" "networkmanager_customer_gateway_associations" {
  for_each = var.networkmanager_customer_gateway_associations

  customer_gateway_arn = each.value.customer_gateway_arn
  device_id            = each.value.device_id
  global_network_id    = each.value.global_network_id
  link_id              = each.value.link_id
}
