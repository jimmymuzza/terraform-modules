variable "stack_hci_deployment_settings" {
  description = <<EOT
Map of stack_hci_deployment_settings, attributes below
Required:
    - arc_resource_ids
    - stack_hci_cluster_id
    - version
    - scale_unit
EOT

  type = map(object({
    arc_resource_ids     = list(string)
    stack_hci_cluster_id = string
    version              = string
    scale_unit           = list(object({
            active_directory_organizational_unit_path = string
            domain_fqdn                               = string
            name_prefix                               = string
            secrets_location                          = string
            bitlocker_boot_volume_enabled             = optional(bool)
            bitlocker_data_volume_enabled             = optional(bool)
            credential_guard_enabled                  = optional(bool)
            drift_control_enabled                     = optional(bool)
            drtm_protection_enabled                   = optional(bool)
            episodic_data_upload_enabled              = optional(bool)
            eu_location_enabled                       = optional(bool)
            hvci_protection_enabled                   = optional(bool)
            side_channel_mitigation_enabled           = optional(bool)
            smb_cluster_encryption_enabled            = optional(bool)
            smb_signing_enabled                       = optional(bool)
            streaming_data_client_enabled             = optional(bool)
            wdac_enabled                              = optional(bool)
            cluster                                   = list(object({
                azure_service_endpoint = string
                cloud_account_name     = string
                name                   = string
                witness_path           = string
                witness_type           = string
            }))
            host_network                              = list(object({
                storage_auto_ip_enabled                 = optional(bool)
                storage_connectivity_switchless_enabled = optional(bool)
                intent                                  = list(object({
                    adapter                                       = list(string)
                    name                                          = string
                    traffic_type                                  = list(string)
                    adapter_property_override_enabled             = optional(bool)
                    qos_policy_override_enabled                   = optional(bool)
                    virtual_switch_configuration_override_enabled = optional(bool)
                    adapter_property_override                     = optional(list(object({
                        jumbo_packet              = optional(string)
                        network_direct            = optional(string)
                        network_direct_technology = optional(string)
                    })))
                    qos_policy_override                           = optional(list(object({
                        bandwidth_percentage_smb          = optional(string)
                        priority_value8021_action_cluster = optional(string)
                        priority_value8021_action_smb     = optional(string)
                    })))
                    virtual_switch_configuration_override         = optional(list(object({
                        enable_iov               = optional(string)
                        load_balancing_algorithm = optional(string)
                    })))
                }))
                storage_network                         = list(object({
                    name                 = string
                    network_adapter_name = string
                    vlan_id              = string
                }))
            }))
            infrastructure_network                    = list(object({
                dns_server   = list(string)
                gateway      = string
                subnet_mask  = string
                dhcp_enabled = optional(bool)
                ip_pool      = list(object({
                    ending_address   = string
                    starting_address = string
                }))
            }))
            optional_service                          = list(object({
                custom_location = string
            }))
            physical_node                             = list(object({
                ipv4_address = string
                name         = string
            }))
            storage                                   = list(object({
                configuration_mode = string
            }))
        }))
  }))
}
