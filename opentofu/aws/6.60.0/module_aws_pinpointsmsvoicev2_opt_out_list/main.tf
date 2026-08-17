resource "aws_pinpointsmsvoicev2_opt_out_list" "pinpointsmsvoicev2_opt_out_lists" {
  for_each = var.pinpointsmsvoicev2_opt_out_lists

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags
}
