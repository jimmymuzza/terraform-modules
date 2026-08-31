resource "aws_dx_macsec_key_association" "dx_macsec_key_associations" {
  for_each = var.dx_macsec_key_associations

  connection_id = each.value.connection_id
  cak           = each.value.cak
  ckn           = each.value.ckn
  region        = each.value.region
  secret_arn    = each.value.secret_arn
}
