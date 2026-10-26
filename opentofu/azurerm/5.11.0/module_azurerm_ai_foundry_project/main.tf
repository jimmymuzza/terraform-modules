resource "azurerm_ai_foundry_project" "ai_foundry_projects" {
  for_each = var.ai_foundry_projects

  ai_services_hub_id             = each.value.ai_services_hub_id
  location                       = each.value.location
  name                           = each.value.name
  description                    = each.value.description
  friendly_name                  = each.value.friendly_name
  high_business_impact_enabled   = each.value.high_business_impact_enabled
  primary_user_assigned_identity = each.value.primary_user_assigned_identity
  tags                           = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
