resource "aws_autoscaling_attachment" "autoscaling_attachments" {
  for_each = var.autoscaling_attachments

  autoscaling_group_name = each.value.autoscaling_group_name
  elb                    = each.value.elb
  lb_target_group_arn    = each.value.lb_target_group_arn
  region                 = each.value.region
}
