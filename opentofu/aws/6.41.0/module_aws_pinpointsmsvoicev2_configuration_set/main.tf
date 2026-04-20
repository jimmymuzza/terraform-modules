resource "aws_pinpointsmsvoicev2_configuration_set" "pinpointsmsvoicev2_configuration_sets" {
  for_each = var.pinpointsmsvoicev2_configuration_sets

  name                 = each.value.name
  default_message_type = each.value.default_message_type
  default_sender_id    = each.value.default_sender_id
  region               = each.value.region
  tags                 = each.value.tags
}
