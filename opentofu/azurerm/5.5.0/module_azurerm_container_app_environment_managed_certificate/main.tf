resource "azurerm_container_app_environment_managed_certificate" "container_app_environment_managed_certificates" {
  for_each = var.container_app_environment_managed_certificates

  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  subject_name                 = each.value.subject_name
  domain_control_validation    = each.value.domain_control_validation
  tags                         = each.value.tags
}
