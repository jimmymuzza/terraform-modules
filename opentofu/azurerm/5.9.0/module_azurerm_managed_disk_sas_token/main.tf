resource "azurerm_managed_disk_sas_token" "managed_disk_sas_tokens" {
  for_each = var.managed_disk_sas_tokens

  access_level        = each.value.access_level
  duration_in_seconds = each.value.duration_in_seconds
  managed_disk_id     = each.value.managed_disk_id
}
