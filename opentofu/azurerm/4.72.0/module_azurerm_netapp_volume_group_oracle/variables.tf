variable "netapp_volume_group_oracles" {
  description = <<EOT
Map of netapp_volume_group_oracles, attributes below
Required:
    - account_name
    - application_identifier
    - group_description
    - location
    - name
    - resource_group_name
    - volume
EOT

  type = map(object({
    account_name           = string
    application_identifier = string
    group_description      = string
    location               = string
    name                   = string
    resource_group_name    = string
    volume                 = list(object({
            capacity_pool_id                = string
            name                            = string
            protocols                       = list(string)
            security_style                  = string
            service_level                   = string
            snapshot_directory_visible      = bool
            storage_quota_in_gb             = number
            subnet_id                       = string
            throughput_in_mibps             = number
            volume_path                     = string
            volume_spec_name                = string
            encryption_key_source           = optional(string)
            key_vault_private_endpoint_id   = optional(string)
            network_features                = optional(string)
            proximity_placement_group_id    = optional(string)
            tags                            = optional(map(string))
            zone                            = optional(string)
            data_protection_replication     = optional(list(object({
                remote_volume_location    = string
                remote_volume_resource_id = string
                replication_frequency     = string
                endpoint_type             = optional(string)
            })))
            data_protection_snapshot_policy = optional(list(object({
                snapshot_policy_id = string
            })))
            export_policy_rule              = list(object({
                allowed_clients     = string
                nfsv3_enabled       = bool
                nfsv41_enabled      = bool
                rule_index          = number
                root_access_enabled = optional(bool)
                unix_read_only      = optional(bool)
                unix_read_write     = optional(bool)
            }))
        }))
  }))
}
