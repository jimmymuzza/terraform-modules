resource "aws_dms_certificate" "dms_certificates" {
  for_each = var.dms_certificates

  certificate_id     = each.value.certificate_id
  certificate_pem    = each.value.certificate_pem
  certificate_wallet = each.value.certificate_wallet
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
