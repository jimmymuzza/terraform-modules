resource "aws_organizations_aws_service_access" "organizations_aws_service_accesses" {
  for_each = var.organizations_aws_service_accesses

  service_principal = each.value.service_principal
}
