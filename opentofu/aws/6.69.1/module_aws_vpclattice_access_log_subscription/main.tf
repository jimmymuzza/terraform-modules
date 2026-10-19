resource "aws_vpclattice_access_log_subscription" "vpclattice_access_log_subscriptions" {
  for_each = var.vpclattice_access_log_subscriptions

  destination_arn          = each.value.destination_arn
  resource_identifier      = each.value.resource_identifier
  region                   = each.value.region
  service_network_log_type = each.value.service_network_log_type
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
}
