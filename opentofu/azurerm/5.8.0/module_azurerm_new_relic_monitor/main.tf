resource "azurerm_new_relic_monitor" "new_relic_monitors" {
  for_each = var.new_relic_monitors

  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  account_creation_source = each.value.account_creation_source
  account_id              = each.value.account_id
  ingestion_key           = each.value.ingestion_key
  org_creation_source     = each.value.org_creation_source
  organization_id         = each.value.organization_id
  user_id                 = each.value.user_id

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      effective_date = plan.value.effective_date
      billing_cycle  = plan.value.billing_cycle
      plan_id        = plan.value.plan_id
      usage_type     = plan.value.usage_type
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? each.value.user : []
    content {
      email        = user.value.email
      first_name   = user.value.first_name
      last_name    = user.value.last_name
      phone_number = user.value.phone_number
    }
  }
}
