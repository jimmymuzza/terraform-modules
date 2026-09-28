resource "aws_iot_certificate" "iot_certificates" {
  for_each = var.iot_certificates

  active          = each.value.active
  ca_pem          = each.value.ca_pem
  certificate_pem = each.value.certificate_pem
  csr             = each.value.csr
  region          = each.value.region
}
