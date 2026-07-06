resource "aws_opensearchserverless_security_config" "opensearchserverless_security_configs" {
  for_each = var.opensearchserverless_security_configs

  name        = each.value.name
  type        = each.value.type
  description = each.value.description
  region      = each.value.region

  dynamic "saml_options" {
    for_each = each.value.saml_options != null ? each.value.saml_options : []
    content {
      metadata        = saml_options.value.metadata
      group_attribute = saml_options.value.group_attribute
      session_timeout = saml_options.value.session_timeout
      user_attribute  = saml_options.value.user_attribute
    }
  }
}
