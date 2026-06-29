resource "azuread_application_certificate" "application_certificates" {
  for_each = var.application_certificates

  application_id    = each.value.application_id
  value             = each.value.value
  encoding          = each.value.encoding
  end_date          = each.value.end_date
  end_date_relative = each.value.end_date_relative
  key_id            = each.value.key_id
  start_date        = each.value.start_date
  type              = each.value.type
}
