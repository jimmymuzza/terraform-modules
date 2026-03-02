resource "azurerm_federated_identity_credential" "federated_identity_credentials" {
  for_each = var.federated_identity_credentials

  audience            = each.value.audience
  issuer              = each.value.issuer
  name                = each.value.name
  parent_id           = each.value.parent_id
  subject             = each.value.subject
  resource_group_name = each.value.resource_group_name
}
