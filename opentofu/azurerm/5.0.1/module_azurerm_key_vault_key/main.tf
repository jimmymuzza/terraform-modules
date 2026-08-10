resource "azurerm_key_vault_key" "key_vault_keys" {
  for_each = var.key_vault_keys

  key_opts        = each.value.key_opts
  key_type        = each.value.key_type
  key_vault_id    = each.value.key_vault_id
  name            = each.value.name
  curve           = each.value.curve
  expiration_date = each.value.expiration_date
  key_size        = each.value.key_size
  not_before_date = each.value.not_before_date
  tags            = each.value.tags

  dynamic "release_policy" {
    for_each = each.value.release_policy != null ? each.value.release_policy : []
    content {
      json      = release_policy.value.json
      immutable = release_policy.value.immutable
    }
  }

  dynamic "rotation_policy" {
    for_each = each.value.rotation_policy != null ? each.value.rotation_policy : []
    content {
      expire_after         = rotation_policy.value.expire_after
      notify_before_expiry = rotation_policy.value.notify_before_expiry

      dynamic "automatic" {
        for_each = rotation_policy.value.automatic != null ? rotation_policy.value.automatic : []
        content {
          time_after_creation = automatic.value.time_after_creation
          time_before_expiry  = automatic.value.time_before_expiry
        }
      }
    }
  }
}
