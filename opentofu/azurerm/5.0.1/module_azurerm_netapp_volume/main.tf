resource "azurerm_netapp_volume" "netapp_volumes" {
  for_each = var.netapp_volumes

  account_name                                         = each.value.account_name
  location                                             = each.value.location
  name                                                 = each.value.name
  pool_name                                            = each.value.pool_name
  resource_group_name                                  = each.value.resource_group_name
  service_level                                        = each.value.service_level
  storage_quota_in_gb                                  = each.value.storage_quota_in_gb
  subnet_id                                            = each.value.subnet_id
  volume_path                                          = each.value.volume_path
  accept_grow_capacity_pool_for_short_term_clone_split = each.value.accept_grow_capacity_pool_for_short_term_clone_split
  azure_vmware_data_store_enabled                      = each.value.azure_vmware_data_store_enabled
  create_from_snapshot_resource_id                     = each.value.create_from_snapshot_resource_id
  encryption_key_source                                = each.value.encryption_key_source
  kerberos_enabled                                     = each.value.kerberos_enabled
  key_vault_private_endpoint_id                        = each.value.key_vault_private_endpoint_id
  large_volume_enabled                                 = each.value.large_volume_enabled
  network_features                                     = each.value.network_features
  protocols                                            = each.value.protocols
  security_style                                       = each.value.security_style
  smb3_protocol_encryption_enabled                     = each.value.smb3_protocol_encryption_enabled
  smb_access_based_enumeration_enabled                 = each.value.smb_access_based_enumeration_enabled
  smb_continuous_availability_enabled                  = each.value.smb_continuous_availability_enabled
  smb_non_browsable_enabled                            = each.value.smb_non_browsable_enabled
  snapshot_directory_visible                           = each.value.snapshot_directory_visible
  tags                                                 = each.value.tags
  throughput_in_mibps                                  = each.value.throughput_in_mibps
  zone                                                 = each.value.zone

  dynamic "cool_access" {
    for_each = each.value.cool_access != null ? each.value.cool_access : []
    content {
      coolness_period_in_days = cool_access.value.coolness_period_in_days
      retrieval_policy        = cool_access.value.retrieval_policy
      tiering_policy          = cool_access.value.tiering_policy
    }
  }

  dynamic "data_protection_advanced_ransomware" {
    for_each = each.value.data_protection_advanced_ransomware != null ? each.value.data_protection_advanced_ransomware : []
    content {
      protection_enabled = data_protection_advanced_ransomware.value.protection_enabled
    }
  }

  dynamic "data_protection_backup_policy" {
    for_each = each.value.data_protection_backup_policy != null ? each.value.data_protection_backup_policy : []
    content {
      backup_policy_id = data_protection_backup_policy.value.backup_policy_id
      backup_vault_id  = data_protection_backup_policy.value.backup_vault_id
      policy_enabled   = data_protection_backup_policy.value.policy_enabled
    }
  }

  dynamic "data_protection_replication" {
    for_each = each.value.data_protection_replication != null ? each.value.data_protection_replication : []
    content {
      remote_volume_location    = data_protection_replication.value.remote_volume_location
      remote_volume_resource_id = data_protection_replication.value.remote_volume_resource_id
      replication_frequency     = data_protection_replication.value.replication_frequency
      endpoint_type             = data_protection_replication.value.endpoint_type
    }
  }

  dynamic "data_protection_snapshot_policy" {
    for_each = each.value.data_protection_snapshot_policy != null ? each.value.data_protection_snapshot_policy : []
    content {
      snapshot_policy_id = data_protection_snapshot_policy.value.snapshot_policy_id
    }
  }

  dynamic "export_policy_rule" {
    for_each = each.value.export_policy_rule != null ? each.value.export_policy_rule : []
    content {
      allowed_clients                = export_policy_rule.value.allowed_clients
      rule_index                     = export_policy_rule.value.rule_index
      kerberos_5_read_only_enabled   = export_policy_rule.value.kerberos_5_read_only_enabled
      kerberos_5_read_write_enabled  = export_policy_rule.value.kerberos_5_read_write_enabled
      kerberos_5i_read_only_enabled  = export_policy_rule.value.kerberos_5i_read_only_enabled
      kerberos_5i_read_write_enabled = export_policy_rule.value.kerberos_5i_read_write_enabled
      kerberos_5p_read_only_enabled  = export_policy_rule.value.kerberos_5p_read_only_enabled
      kerberos_5p_read_write_enabled = export_policy_rule.value.kerberos_5p_read_write_enabled
      protocol                       = export_policy_rule.value.protocol
      root_access_enabled            = export_policy_rule.value.root_access_enabled
      unix_read_only                 = export_policy_rule.value.unix_read_only
      unix_read_write                = export_policy_rule.value.unix_read_write
    }
  }
}
