resource "azurerm_load_test" "load_tests" {
  for_each = var.load_tests

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  tags                = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      key_url = encryption.value.key_url

      dynamic "identity" {
        for_each = encryption.value.identity != null ? encryption.value.identity : []
        content {
          identity_id = identity.value.identity_id
          type        = identity.value.type
        }
      }
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
