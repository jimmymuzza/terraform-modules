resource "azurerm_private_endpoint_application_security_group_association" "private_endpoint_application_security_group_associations" {
  for_each = var.private_endpoint_application_security_group_associations

  application_security_group_id = each.value.application_security_group_id
  private_endpoint_id           = each.value.private_endpoint_id
}
