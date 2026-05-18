resource "azurerm_api_management_subscription" "api_management_subscriptions" {
  for_each = var.api_management_subscriptions

  api_management_name = each.value.api_management_name
  display_name        = each.value.display_name
  resource_group_name = each.value.resource_group_name
  allow_tracing       = each.value.allow_tracing
  api_id              = each.value.api_id
  primary_key         = each.value.primary_key
  product_id          = each.value.product_id
  secondary_key       = each.value.secondary_key
  state               = each.value.state
  subscription_id     = each.value.subscription_id
  user_id             = each.value.user_id
}
