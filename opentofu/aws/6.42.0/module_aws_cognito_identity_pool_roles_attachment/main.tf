resource "aws_cognito_identity_pool_roles_attachment" "cognito_identity_pool_roles_attachments" {
  for_each = var.cognito_identity_pool_roles_attachments

  identity_pool_id = each.value.identity_pool_id
  roles            = each.value.roles
  region           = each.value.region

  dynamic "role_mapping" {
    for_each = each.value.role_mapping != null ? each.value.role_mapping : []
    content {
      identity_provider         = role_mapping.value.identity_provider
      type                      = role_mapping.value.type
      ambiguous_role_resolution = role_mapping.value.ambiguous_role_resolution

      dynamic "mapping_rule" {
        for_each = role_mapping.value.mapping_rule != null ? role_mapping.value.mapping_rule : []
        content {
          claim      = mapping_rule.value.claim
          match_type = mapping_rule.value.match_type
          role_arn   = mapping_rule.value.role_arn
          value      = mapping_rule.value.value
        }
      }
    }
  }
}
