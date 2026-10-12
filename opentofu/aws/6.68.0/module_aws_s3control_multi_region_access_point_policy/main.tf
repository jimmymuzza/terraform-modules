resource "aws_s3control_multi_region_access_point_policy" "s3control_multi_region_access_point_policies" {
  for_each = var.s3control_multi_region_access_point_policies

  account_id = each.value.account_id
  region     = each.value.region

  dynamic "details" {
    for_each = each.value.details != null ? each.value.details : []
    content {
      name   = details.value.name
      policy = details.value.policy
    }
  }
}
