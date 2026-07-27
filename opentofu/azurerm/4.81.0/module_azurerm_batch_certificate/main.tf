resource "azurerm_batch_certificate" "batch_certificates" {
  for_each = var.batch_certificates

  account_name         = each.value.account_name
  certificate          = each.value.certificate
  format               = each.value.format
  resource_group_name  = each.value.resource_group_name
  thumbprint           = each.value.thumbprint
  thumbprint_algorithm = each.value.thumbprint_algorithm
  password             = each.value.password
}
