resource "aws_acmpca_permission" "acmpca_permissions" {
  for_each = var.acmpca_permissions

  actions                   = each.value.actions
  certificate_authority_arn = each.value.certificate_authority_arn
  principal                 = each.value.principal
  region                    = each.value.region
  source_account            = each.value.source_account
}
