resource "aws_s3control_access_grants_instance" "s3control_access_grants_instances" {
  for_each = var.s3control_access_grants_instances

  account_id          = each.value.account_id
  identity_center_arn = each.value.identity_center_arn
  region              = each.value.region
  tags                = each.value.tags
}
