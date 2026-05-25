resource "aws_ssmcontacts_contact_channel" "ssmcontacts_contact_channels" {
  for_each = var.ssmcontacts_contact_channels

  contact_id = each.value.contact_id
  name       = each.value.name
  type       = each.value.type
  region     = each.value.region

  dynamic "delivery_address" {
    for_each = each.value.delivery_address != null ? each.value.delivery_address : []
    content {
      simple_address = delivery_address.value.simple_address
    }
  }
}
