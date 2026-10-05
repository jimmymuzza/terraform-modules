resource "aws_s3control_access_point_policy" "s3control_access_point_policies" {
  for_each = var.s3control_access_point_policies

  access_point_arn = each.value.access_point_arn
  policy           = each.value.policy
  region           = each.value.region
}
