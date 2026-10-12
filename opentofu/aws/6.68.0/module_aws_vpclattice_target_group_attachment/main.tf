resource "aws_vpclattice_target_group_attachment" "vpclattice_target_group_attachments" {
  for_each = var.vpclattice_target_group_attachments

  target_group_identifier = each.value.target_group_identifier
  region                  = each.value.region

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      port = target.value.port
    }
  }
}
