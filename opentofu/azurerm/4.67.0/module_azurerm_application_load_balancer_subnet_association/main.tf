resource "azurerm_application_load_balancer_subnet_association" "application_load_balancer_subnet_associations" {
  for_each = var.application_load_balancer_subnet_associations

  application_load_balancer_id = each.value.application_load_balancer_id
  name                         = each.value.name
  subnet_id                    = each.value.subnet_id
  tags                         = each.value.tags
}
