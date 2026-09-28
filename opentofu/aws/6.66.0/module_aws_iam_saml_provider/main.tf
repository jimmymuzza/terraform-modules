resource "aws_iam_saml_provider" "iam_saml_providers" {
  for_each = var.iam_saml_providers

  name                   = each.value.name
  saml_metadata_document = each.value.saml_metadata_document
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
