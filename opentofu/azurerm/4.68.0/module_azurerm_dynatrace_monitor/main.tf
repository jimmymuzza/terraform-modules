resource "azurerm_dynatrace_monitor" "dynatrace_monitors" {
  for_each = var.dynatrace_monitors

  location                 = each.value.location
  marketplace_subscription = each.value.marketplace_subscription
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  monitoring_enabled       = each.value.monitoring_enabled
  tags                     = each.value.tags

  dynamic "environment_properties" {
    for_each = each.value.environment_properties != null ? each.value.environment_properties : []
    content {

      dynamic "environment_info" {
        for_each = environment_properties.value.environment_info != null ? environment_properties.value.environment_info : []
        content {
          environment_id = environment_info.value.environment_id
        }
      }
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      plan          = plan.value.plan
      billing_cycle = plan.value.billing_cycle
      usage_type    = plan.value.usage_type
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? each.value.user : []
    content {
      email        = user.value.email
      first_name   = user.value.first_name
      last_name    = user.value.last_name
      country      = user.value.country
      phone_number = user.value.phone_number
    }
  }
}
