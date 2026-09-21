resource "aws_s3control_access_grants_location" "s3control_access_grants_locations" {
  for_each = var.s3control_access_grants_locations

  iam_role_arn   = each.value.iam_role_arn
  location_scope = each.value.location_scope
  account_id     = each.value.account_id
  region         = each.value.region
  tags           = each.value.tags
}
