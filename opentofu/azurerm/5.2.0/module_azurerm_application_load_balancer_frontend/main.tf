resource "azurerm_application_load_balancer_frontend" "application_load_balancer_frontends" {
  for_each = var.application_load_balancer_frontends

  application_load_balancer_id = each.value.application_load_balancer_id
  name                         = each.value.name
  tags                         = each.value.tags
}
