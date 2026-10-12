resource "aws_signer_signing_profile_permission" "signer_signing_profile_permissions" {
  for_each = var.signer_signing_profile_permissions

  action              = each.value.action
  principal           = each.value.principal
  profile_name        = each.value.profile_name
  profile_version     = each.value.profile_version
  region              = each.value.region
  statement_id        = each.value.statement_id
  statement_id_prefix = each.value.statement_id_prefix
}
