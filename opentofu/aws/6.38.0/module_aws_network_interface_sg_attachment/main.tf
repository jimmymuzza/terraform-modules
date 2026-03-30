resource "aws_network_interface_sg_attachment" "network_interface_sg_attachments" {
  for_each = var.network_interface_sg_attachments

  network_interface_id = each.value.network_interface_id
  security_group_id    = each.value.security_group_id
  region               = each.value.region
}
