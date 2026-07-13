resource "aws_organizations_organization" "organizations_organizations" {
  for_each = var.organizations_organizations

  aws_service_access_principals = each.value.aws_service_access_principals
  enabled_policy_types          = each.value.enabled_policy_types
  feature_set                   = each.value.feature_set
  return_organization_only      = each.value.return_organization_only
}
