resource "aws_lb_target_group_attachment" "lb_target_group_attachments" {
  for_each = var.lb_target_group_attachments

  target_group_arn  = each.value.target_group_arn
  target_id         = each.value.target_id
  availability_zone = each.value.availability_zone
  port              = each.value.port
  quic_server_id    = each.value.quic_server_id
  region            = each.value.region
}
