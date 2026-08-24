resource "aws_lakeformation_resource" "lakeformation_resources" {
  for_each = var.lakeformation_resources

  arn                     = each.value.arn
  hybrid_access_enabled   = each.value.hybrid_access_enabled
  region                  = each.value.region
  role_arn                = each.value.role_arn
  use_service_linked_role = each.value.use_service_linked_role
  with_federation         = each.value.with_federation
  with_privileged_access  = each.value.with_privileged_access
}
