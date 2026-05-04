resource "azurerm_databricks_workspace" "databricks_workspaces" {
  for_each = var.databricks_workspaces

  location                                            = each.value.location
  name                                                = each.value.name
  resource_group_name                                 = each.value.resource_group_name
  sku                                                 = each.value.sku
  access_connector_id                                 = each.value.access_connector_id
  customer_managed_key_enabled                        = each.value.customer_managed_key_enabled
  default_storage_firewall_enabled                    = each.value.default_storage_firewall_enabled
  infrastructure_encryption_enabled                   = each.value.infrastructure_encryption_enabled
  load_balancer_backend_address_pool_id               = each.value.load_balancer_backend_address_pool_id
  managed_disk_cmk_key_vault_id                       = each.value.managed_disk_cmk_key_vault_id
  managed_disk_cmk_key_vault_key_id                   = each.value.managed_disk_cmk_key_vault_key_id
  managed_disk_cmk_rotation_to_latest_version_enabled = each.value.managed_disk_cmk_rotation_to_latest_version_enabled
  managed_resource_group_name                         = each.value.managed_resource_group_name
  managed_services_cmk_key_vault_id                   = each.value.managed_services_cmk_key_vault_id
  managed_services_cmk_key_vault_key_id               = each.value.managed_services_cmk_key_vault_key_id
  network_security_group_rules_required               = each.value.network_security_group_rules_required
  public_network_access_enabled                       = each.value.public_network_access_enabled
  tags                                                = each.value.tags

  dynamic "custom_parameters" {
    for_each = each.value.custom_parameters != null ? each.value.custom_parameters : []
    content {
      machine_learning_workspace_id                        = custom_parameters.value.machine_learning_workspace_id
      nat_gateway_name                                     = custom_parameters.value.nat_gateway_name
      no_public_ip                                         = custom_parameters.value.no_public_ip
      private_subnet_name                                  = custom_parameters.value.private_subnet_name
      private_subnet_network_security_group_association_id = custom_parameters.value.private_subnet_network_security_group_association_id
      public_ip_name                                       = custom_parameters.value.public_ip_name
      public_subnet_name                                   = custom_parameters.value.public_subnet_name
      public_subnet_network_security_group_association_id  = custom_parameters.value.public_subnet_network_security_group_association_id
      storage_account_name                                 = custom_parameters.value.storage_account_name
      storage_account_sku_name                             = custom_parameters.value.storage_account_sku_name
      virtual_network_id                                   = custom_parameters.value.virtual_network_id
      vnet_address_prefix                                  = custom_parameters.value.vnet_address_prefix
    }
  }

  dynamic "enhanced_security_compliance" {
    for_each = each.value.enhanced_security_compliance != null ? each.value.enhanced_security_compliance : []
    content {
      automatic_cluster_update_enabled      = enhanced_security_compliance.value.automatic_cluster_update_enabled
      compliance_security_profile_enabled   = enhanced_security_compliance.value.compliance_security_profile_enabled
      compliance_security_profile_standards = enhanced_security_compliance.value.compliance_security_profile_standards
      enhanced_security_monitoring_enabled  = enhanced_security_compliance.value.enhanced_security_monitoring_enabled
    }
  }
}
