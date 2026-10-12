resource "azurerm_api_management_gateway_host_name_configuration" "api_management_gateway_host_name_configurations" {
  for_each = var.api_management_gateway_host_name_configurations

  api_management_id                  = each.value.api_management_id
  certificate_id                     = each.value.certificate_id
  gateway_name                       = each.value.gateway_name
  host_name                          = each.value.host_name
  name                               = each.value.name
  http2_enabled                      = each.value.http2_enabled
  request_client_certificate_enabled = each.value.request_client_certificate_enabled
  tls10_enabled                      = each.value.tls10_enabled
  tls11_enabled                      = each.value.tls11_enabled
}
