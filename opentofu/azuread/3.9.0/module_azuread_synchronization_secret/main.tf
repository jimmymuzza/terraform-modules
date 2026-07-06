resource "azuread_synchronization_secret" "synchronization_secrets" {
  for_each = var.synchronization_secrets

  service_principal_id = each.value.service_principal_id

  dynamic "credential" {
    for_each = each.value.credential != null ? each.value.credential : []
    content {
      key   = credential.value.key
      value = credential.value.value
    }
  }
}
