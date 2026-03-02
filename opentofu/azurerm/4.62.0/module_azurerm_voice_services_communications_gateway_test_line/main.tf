resource "azurerm_voice_services_communications_gateway_test_line" "voice_services_communications_gateway_test_lines" {
  for_each = var.voice_services_communications_gateway_test_lines

  location                                 = each.value.location
  name                                     = each.value.name
  phone_number                             = each.value.phone_number
  purpose                                  = each.value.purpose
  voice_services_communications_gateway_id = each.value.voice_services_communications_gateway_id
  tags                                     = each.value.tags
}
