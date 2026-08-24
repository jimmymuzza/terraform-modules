resource "aws_pinpointsmsvoicev2_sender_id" "pinpointsmsvoicev2_sender_ids" {
  for_each = var.pinpointsmsvoicev2_sender_ids

  iso_country_code            = each.value.iso_country_code
  sender_id                   = each.value.sender_id
  deletion_protection_enabled = each.value.deletion_protection_enabled
  message_types               = each.value.message_types
  region                      = each.value.region
  tags                        = each.value.tags
}
