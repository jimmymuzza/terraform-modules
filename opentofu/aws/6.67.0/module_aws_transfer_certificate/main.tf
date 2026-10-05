resource "aws_transfer_certificate" "transfer_certificates" {
  for_each = var.transfer_certificates

  certificate       = each.value.certificate
  usage             = each.value.usage
  certificate_chain = each.value.certificate_chain
  description       = each.value.description
  private_key       = each.value.private_key
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
