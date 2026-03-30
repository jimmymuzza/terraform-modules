resource "aws_autoscaling_group_tag" "autoscaling_group_tags" {
  for_each = var.autoscaling_group_tags

  autoscaling_group_name = each.value.autoscaling_group_name
  region                 = each.value.region

  dynamic "tag" {
    for_each = each.value.tag != null ? each.value.tag : []
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }
}
