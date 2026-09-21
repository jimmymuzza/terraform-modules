resource "aws_s3control_access_grants_instance_resource_policy" "s3control_access_grants_instance_resource_policies" {
  for_each = var.s3control_access_grants_instance_resource_policies

  policy     = each.value.policy
  account_id = each.value.account_id
  region     = each.value.region
}
