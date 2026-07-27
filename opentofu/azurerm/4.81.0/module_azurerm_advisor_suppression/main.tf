resource "azurerm_advisor_suppression" "advisor_suppressions" {
  for_each = var.advisor_suppressions

  name              = each.value.name
  recommendation_id = each.value.recommendation_id
  resource_id       = each.value.resource_id
  ttl               = each.value.ttl
}
