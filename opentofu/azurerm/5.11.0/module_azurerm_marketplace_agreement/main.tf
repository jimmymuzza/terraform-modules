resource "azurerm_marketplace_agreement" "marketplace_agreements" {
  for_each = var.marketplace_agreements

  offer     = each.value.offer
  plan      = each.value.plan
  publisher = each.value.publisher
}
