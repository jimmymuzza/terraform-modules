resource "aws_opensearchserverless_security_config" "opensearchserverless_security_configs" {
  for_each = var.opensearchserverless_security_configs

  name        = each.value.name
  type        = each.value.type
  description = each.value.description
  region      = each.value.region

  dynamic "iam_federation_options" {
    for_each = each.value.iam_federation_options != null ? each.value.iam_federation_options : []
    content {
      group_attribute = iam_federation_options.value.group_attribute
      user_attribute  = iam_federation_options.value.user_attribute
    }
  }

  dynamic "iam_identity_center_options" {
    for_each = each.value.iam_identity_center_options != null ? each.value.iam_identity_center_options : []
    content {
      instance_arn    = iam_identity_center_options.value.instance_arn
      group_attribute = iam_identity_center_options.value.group_attribute
      user_attribute  = iam_identity_center_options.value.user_attribute
    }
  }

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
