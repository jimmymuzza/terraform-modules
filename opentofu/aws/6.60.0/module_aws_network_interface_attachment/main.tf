resource "aws_network_interface_attachment" "network_interface_attachments" {
  for_each = var.network_interface_attachments

  device_index         = each.value.device_index
  instance_id          = each.value.instance_id
  network_interface_id = each.value.network_interface_id
  network_card_index   = each.value.network_card_index
  region               = each.value.region
}
