resource "aws_networkmanager_attachment_accepter" "networkmanager_attachment_accepters" {
  for_each = var.networkmanager_attachment_accepters

  attachment_id   = each.value.attachment_id
  attachment_type = each.value.attachment_type
}
