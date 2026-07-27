resource "aws_pinpointsmsvoicev2_pool" "pinpointsmsvoicev2_pools" {
  for_each = var.pinpointsmsvoicev2_pools

  message_type                  = each.value.message_type
  origination_identities        = each.value.origination_identities
  deletion_protection_enabled   = each.value.deletion_protection_enabled
  iso_country_code              = each.value.iso_country_code
  opt_out_list_name             = each.value.opt_out_list_name
  region                        = each.value.region
  self_managed_opt_outs_enabled = each.value.self_managed_opt_outs_enabled
  shared_routes_enabled         = each.value.shared_routes_enabled
  tags                          = each.value.tags
  two_way_channel_arn           = each.value.two_way_channel_arn
  two_way_channel_role          = each.value.two_way_channel_role
  two_way_enabled               = each.value.two_way_enabled
}
