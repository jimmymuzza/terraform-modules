resource "aws_kms_grant" "kms_grants" {
  for_each = var.kms_grants

  grantee_principal     = each.value.grantee_principal
  key_id                = each.value.key_id
  operations            = each.value.operations
  grant_creation_tokens = each.value.grant_creation_tokens
  name                  = each.value.name
  region                = each.value.region
  retire_on_delete      = each.value.retire_on_delete
  retiring_principal    = each.value.retiring_principal

  dynamic "constraints" {
    for_each = each.value.constraints != null ? each.value.constraints : []
    content {
      encryption_context_equals = constraints.value.encryption_context_equals
      encryption_context_subset = constraints.value.encryption_context_subset
    }
  }
}
