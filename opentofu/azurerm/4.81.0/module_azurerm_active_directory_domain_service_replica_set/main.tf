resource "azurerm_active_directory_domain_service_replica_set" "active_directory_domain_service_replica_sets" {
  for_each = var.active_directory_domain_service_replica_sets

  domain_service_id = each.value.domain_service_id
  location          = each.value.location
  subnet_id         = each.value.subnet_id
}
