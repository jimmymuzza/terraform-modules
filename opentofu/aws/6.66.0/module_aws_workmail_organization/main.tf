resource "aws_workmail_organization" "workmail_organizations" {
  for_each = var.workmail_organizations

  organization_alias                 = each.value.organization_alias
  delete_directory                   = each.value.delete_directory
  delete_identity_center_application = each.value.delete_identity_center_application
  directory_id                       = each.value.directory_id
  interoperability_enabled           = each.value.interoperability_enabled
  kms_key_arn                        = each.value.kms_key_arn
  region                             = each.value.region
  tags                               = each.value.tags
}
