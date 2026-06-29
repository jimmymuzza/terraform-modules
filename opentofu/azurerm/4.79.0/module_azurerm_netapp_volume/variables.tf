variable "netapp_volumes" {
  description = <<EOT
Map of netapp_volumes, attributes below
Required:
    - account_name
    - location
    - name
    - pool_name
    - resource_group_name
    - service_level
    - storage_quota_in_gb
    - subnet_id
    - volume_path
Optional:
    - accept_grow_capacity_pool_for_short_term_clone_split
    - azure_vmware_data_store_enabled
    - create_from_snapshot_resource_id
    - encryption_key_source
    - kerberos_enabled
    - key_vault_private_endpoint_id
    - large_volume_enabled
    - network_features
    - protocols
    - security_style
    - smb3_protocol_encryption_enabled
    - smb_access_based_enumeration_enabled
    - smb_continuous_availability_enabled
    - smb_non_browsable_enabled
    - snapshot_directory_visible
    - tags
    - throughput_in_mibps
    - zone
    - cool_access
    - data_protection_advanced_ransomware
    - data_protection_backup_policy
    - data_protection_replication
    - data_protection_snapshot_policy
    - export_policy_rule
EOT

  type = map(object({
    account_name                                         = string
    location                                             = string
    name                                                 = string
    pool_name                                            = string
    resource_group_name                                  = string
    service_level                                        = string
    storage_quota_in_gb                                  = number
    subnet_id                                            = string
    volume_path                                          = string
    accept_grow_capacity_pool_for_short_term_clone_split = optional(string)
    azure_vmware_data_store_enabled                      = optional(bool)
    create_from_snapshot_resource_id                     = optional(string)
    encryption_key_source                                = optional(string)
    kerberos_enabled                                     = optional(bool)
    key_vault_private_endpoint_id                        = optional(string)
    large_volume_enabled                                 = optional(bool)
    network_features                                     = optional(string)
    protocols                                            = optional(set(string))
    security_style                                       = optional(string)
    smb3_protocol_encryption_enabled                     = optional(bool)
    smb_access_based_enumeration_enabled                 = optional(bool)
    smb_continuous_availability_enabled                  = optional(bool)
    smb_non_browsable_enabled                            = optional(bool)
    snapshot_directory_visible                           = optional(bool)
    tags                                                 = optional(map(string))
    throughput_in_mibps                                  = optional(number)
    zone                                                 = optional(string)
    cool_access                                          = optional(list(object({
            coolness_period_in_days = number
            retrieval_policy        = string
            tiering_policy          = string
        })))
    data_protection_advanced_ransomware                  = optional(list(object({
            protection_enabled = bool
        })))
    data_protection_backup_policy                        = optional(list(object({
            backup_policy_id = string
            backup_vault_id  = string
            policy_enabled   = optional(bool)
        })))
    data_protection_replication                          = optional(list(object({
            remote_volume_location    = string
            remote_volume_resource_id = string
            replication_frequency     = string
            endpoint_type             = optional(string)
        })))
    data_protection_snapshot_policy                      = optional(list(object({
            snapshot_policy_id = string
        })))
    export_policy_rule                                   = optional(list(object({
            allowed_clients                = set(string)
            rule_index                     = number
            kerberos_5_read_only_enabled   = optional(bool)
            kerberos_5_read_write_enabled  = optional(bool)
            kerberos_5i_read_only_enabled  = optional(bool)
            kerberos_5i_read_write_enabled = optional(bool)
            kerberos_5p_read_only_enabled  = optional(bool)
            kerberos_5p_read_write_enabled = optional(bool)
            protocol                       = optional(list(string))
            protocols_enabled              = optional(list(string))
            root_access_enabled            = optional(bool)
            unix_read_only                 = optional(bool)
            unix_read_write                = optional(bool)
        })))
  }))
}
