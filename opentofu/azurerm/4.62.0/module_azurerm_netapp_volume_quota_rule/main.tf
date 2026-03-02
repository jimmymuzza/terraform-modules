resource "azurerm_netapp_volume_quota_rule" "netapp_volume_quota_rules" {
  for_each = var.netapp_volume_quota_rules

  location          = each.value.location
  name              = each.value.name
  quota_size_in_kib = each.value.quota_size_in_kib
  quota_type        = each.value.quota_type
  volume_id         = each.value.volume_id
  quota_target      = each.value.quota_target
}
