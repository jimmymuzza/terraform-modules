resource "azurerm_eventgrid_partner_configuration" "eventgrid_partner_configurations" {
  for_each = var.eventgrid_partner_configurations

  resource_group_name                     = each.value.resource_group_name
  default_maximum_expiration_time_in_days = each.value.default_maximum_expiration_time_in_days
  tags                                    = each.value.tags

  dynamic "partner_authorization" {
    for_each = each.value.partner_authorization != null ? each.value.partner_authorization : []
    content {
      partner_name                         = partner_authorization.value.partner_name
      partner_registration_id              = partner_authorization.value.partner_registration_id
      authorization_expiration_time_in_utc = partner_authorization.value.authorization_expiration_time_in_utc
    }
  }
}
