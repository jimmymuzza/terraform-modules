resource "azurerm_api_management_gateway_certificate_authority" "api_management_gateway_certificate_authorities" {
  for_each = var.api_management_gateway_certificate_authorities

  api_management_id = each.value.api_management_id
  certificate_name  = each.value.certificate_name
  gateway_name      = each.value.gateway_name
  is_trusted        = each.value.is_trusted
}
