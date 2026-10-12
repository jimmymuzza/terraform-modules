resource "aws_cloudcontrolapi_resource" "cloudcontrolapi_resources" {
  for_each = var.cloudcontrolapi_resources

  desired_state   = each.value.desired_state
  type_name       = each.value.type_name
  region          = each.value.region
  role_arn        = each.value.role_arn
  schema          = each.value.schema
  type_version_id = each.value.type_version_id
}
