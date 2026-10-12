resource "aws_sesv2_email_identity" "sesv2_email_identities" {
  for_each = var.sesv2_email_identities

  email_identity         = each.value.email_identity
  configuration_set_name = each.value.configuration_set_name
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "dkim_signing_attributes" {
    for_each = each.value.dkim_signing_attributes != null ? each.value.dkim_signing_attributes : []
    content {
      domain_signing_private_key = dkim_signing_attributes.value.domain_signing_private_key
      domain_signing_selector    = dkim_signing_attributes.value.domain_signing_selector
      next_signing_key_length    = dkim_signing_attributes.value.next_signing_key_length
    }
  }
}
