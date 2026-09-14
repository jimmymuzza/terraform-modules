resource "aws_s3control_object_lambda_access_point_policy" "s3control_object_lambda_access_point_policies" {
  for_each = var.s3control_object_lambda_access_point_policies

  name       = each.value.name
  policy     = each.value.policy
  account_id = each.value.account_id
  region     = each.value.region
}
