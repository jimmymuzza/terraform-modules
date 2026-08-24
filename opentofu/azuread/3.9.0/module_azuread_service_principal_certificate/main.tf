resource "azuread_service_principal_certificate" "service_principal_certificates" {
  for_each = var.service_principal_certificates

  service_principal_id = each.value.service_principal_id
  value                = each.value.value
  encoding             = each.value.encoding
  end_date             = each.value.end_date
  end_date_relative    = each.value.end_date_relative
  key_id               = each.value.key_id
  start_date           = each.value.start_date
  type                 = each.value.type
}
