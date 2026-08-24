resource "aws_iam_signing_certificate" "iam_signing_certificates" {
  for_each = var.iam_signing_certificates

  certificate_body = each.value.certificate_body
  user_name        = each.value.user_name
  status           = each.value.status
}
