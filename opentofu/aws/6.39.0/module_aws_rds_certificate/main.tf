resource "aws_rds_certificate" "rds_certificates" {
  for_each = var.rds_certificates

  certificate_identifier = each.value.certificate_identifier
  region                 = each.value.region
}
