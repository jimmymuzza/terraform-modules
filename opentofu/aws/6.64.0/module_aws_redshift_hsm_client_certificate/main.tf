resource "aws_redshift_hsm_client_certificate" "redshift_hsm_client_certificates" {
  for_each = var.redshift_hsm_client_certificates

  hsm_client_certificate_identifier = each.value.hsm_client_certificate_identifier
  region                            = each.value.region
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
}
