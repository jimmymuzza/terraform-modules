resource "aws_dx_macsec_key_association" "dx_macsec_key_associations" {
  for_each = var.dx_macsec_key_associations

  connection_id  = each.value.connection_id
  cak            = each.value.cak
  cak_wo         = each.value.cak_wo
  cak_wo_version = each.value.cak_wo_version
  ckn            = each.value.ckn
  ckn_wo         = each.value.ckn_wo
  ckn_wo_version = each.value.ckn_wo_version
  region         = each.value.region
  secret_arn     = each.value.secret_arn
}
