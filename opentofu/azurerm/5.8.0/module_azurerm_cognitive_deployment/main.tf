resource "azurerm_cognitive_deployment" "cognitive_deployments" {
  for_each = var.cognitive_deployments

  cognitive_account_id       = each.value.cognitive_account_id
  name                       = each.value.name
  dynamic_throttling_enabled = each.value.dynamic_throttling_enabled
  rai_policy_name            = each.value.rai_policy_name
  version_upgrade_option     = each.value.version_upgrade_option

  dynamic "model" {
    for_each = each.value.model != null ? each.value.model : []
    content {
      format  = model.value.format
      name    = model.value.name
      version = model.value.version
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      name     = sku.value.name
      capacity = sku.value.capacity
      family   = sku.value.family
      size     = sku.value.size
      tier     = sku.value.tier
    }
  }
}
