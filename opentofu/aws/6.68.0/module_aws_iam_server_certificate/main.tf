resource "aws_iam_server_certificate" "iam_server_certificates" {
  for_each = var.iam_server_certificates

  certificate_body  = each.value.certificate_body
  private_key       = each.value.private_key
  certificate_chain = each.value.certificate_chain
  name              = each.value.name
  name_prefix       = each.value.name_prefix
  path              = each.value.path
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
