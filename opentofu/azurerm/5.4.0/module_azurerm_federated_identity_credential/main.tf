resource "azurerm_federated_identity_credential" "federated_identity_credentials" {
  for_each = var.federated_identity_credentials

  audience                  = each.value.audience
  issuer                    = each.value.issuer
  name                      = each.value.name
  subject                   = each.value.subject
  user_assigned_identity_id = each.value.user_assigned_identity_id
}
