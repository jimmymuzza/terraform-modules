resource "aws_pinpointsmsvoicev2_phone_number" "pinpointsmsvoicev2_phone_numbers" {
  for_each = var.pinpointsmsvoicev2_phone_numbers

  iso_country_code              = each.value.iso_country_code
  message_type                  = each.value.message_type
  number_capabilities           = each.value.number_capabilities
  number_type                   = each.value.number_type
  deletion_protection_enabled   = each.value.deletion_protection_enabled
  force_disassociate            = each.value.force_disassociate
  opt_out_list_name             = each.value.opt_out_list_name
  region                        = each.value.region
  registration_id               = each.value.registration_id
  self_managed_opt_outs_enabled = each.value.self_managed_opt_outs_enabled
  tags                          = each.value.tags
  two_way_channel_arn           = each.value.two_way_channel_arn
  two_way_channel_enabled       = each.value.two_way_channel_enabled
  two_way_channel_role          = each.value.two_way_channel_role
  wait_for_active               = each.value.wait_for_active
}
