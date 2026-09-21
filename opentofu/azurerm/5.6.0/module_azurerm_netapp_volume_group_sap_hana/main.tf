resource "azurerm_netapp_volume_group_sap_hana" "netapp_volume_group_sap_hanas" {
  for_each = var.netapp_volume_group_sap_hanas

  account_name           = each.value.account_name
  application_identifier = each.value.application_identifier
  group_description      = each.value.group_description
  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name

  dynamic "volume" {
    for_each = each.value.volume != null ? each.value.volume : []
    content {
      capacity_pool_id              = volume.value.capacity_pool_id
      name                          = volume.value.name
      protocols                     = volume.value.protocols
      security_style                = volume.value.security_style
      service_level                 = volume.value.service_level
      snapshot_directory_visible    = volume.value.snapshot_directory_visible
      storage_quota_in_gb           = volume.value.storage_quota_in_gb
      subnet_id                     = volume.value.subnet_id
      throughput_in_mibps           = volume.value.throughput_in_mibps
      volume_path                   = volume.value.volume_path
      volume_spec_name              = volume.value.volume_spec_name
      encryption_key_source         = volume.value.encryption_key_source
      key_vault_private_endpoint_id = volume.value.key_vault_private_endpoint_id
      network_features              = volume.value.network_features
      proximity_placement_group_id  = volume.value.proximity_placement_group_id
      tags                          = volume.value.tags
      zone                          = volume.value.zone

      dynamic "data_protection_replication" {
        for_each = volume.value.data_protection_replication != null ? volume.value.data_protection_replication : []
        content {
          remote_volume_location    = data_protection_replication.value.remote_volume_location
          remote_volume_resource_id = data_protection_replication.value.remote_volume_resource_id
          replication_frequency     = data_protection_replication.value.replication_frequency
          endpoint_type             = data_protection_replication.value.endpoint_type
        }
      }

      dynamic "data_protection_snapshot_policy" {
        for_each = volume.value.data_protection_snapshot_policy != null ? volume.value.data_protection_snapshot_policy : []
        content {
          snapshot_policy_id = data_protection_snapshot_policy.value.snapshot_policy_id
        }
      }

      dynamic "export_policy_rule" {
        for_each = volume.value.export_policy_rule != null ? volume.value.export_policy_rule : []
        content {
          allowed_clients     = export_policy_rule.value.allowed_clients
          nfsv3_enabled       = export_policy_rule.value.nfsv3_enabled
          nfsv41_enabled      = export_policy_rule.value.nfsv41_enabled
          rule_index          = export_policy_rule.value.rule_index
          root_access_enabled = export_policy_rule.value.root_access_enabled
          unix_read_only      = export_policy_rule.value.unix_read_only
          unix_read_write     = export_policy_rule.value.unix_read_write
        }
      }
    }
  }
}
