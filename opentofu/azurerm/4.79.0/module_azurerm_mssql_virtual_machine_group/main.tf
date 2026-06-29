resource "azurerm_mssql_virtual_machine_group" "mssql_virtual_machine_groups" {
  for_each = var.mssql_virtual_machine_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sql_image_offer     = each.value.sql_image_offer
  sql_image_sku       = each.value.sql_image_sku
  tags                = each.value.tags

  dynamic "wsfc_domain_profile" {
    for_each = each.value.wsfc_domain_profile != null ? each.value.wsfc_domain_profile : []
    content {
      cluster_subnet_type            = wsfc_domain_profile.value.cluster_subnet_type
      fqdn                           = wsfc_domain_profile.value.fqdn
      cluster_bootstrap_account_name = wsfc_domain_profile.value.cluster_bootstrap_account_name
      cluster_operator_account_name  = wsfc_domain_profile.value.cluster_operator_account_name
      organizational_unit_path       = wsfc_domain_profile.value.organizational_unit_path
      sql_service_account_name       = wsfc_domain_profile.value.sql_service_account_name
      storage_account_primary_key    = wsfc_domain_profile.value.storage_account_primary_key
      storage_account_url            = wsfc_domain_profile.value.storage_account_url
    }
  }
}
