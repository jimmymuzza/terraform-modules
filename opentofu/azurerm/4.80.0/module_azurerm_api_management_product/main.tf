resource "azurerm_api_management_product" "api_management_products" {
  for_each = var.api_management_products

  api_management_name   = each.value.api_management_name
  display_name          = each.value.display_name
  product_id            = each.value.product_id
  published             = each.value.published
  resource_group_name   = each.value.resource_group_name
  approval_required     = each.value.approval_required
  description           = each.value.description
  subscription_required = each.value.subscription_required
  subscriptions_limit   = each.value.subscriptions_limit
  terms                 = each.value.terms
}
