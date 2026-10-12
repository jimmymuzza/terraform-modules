variable "workloads_sap_discovery_virtual_instances" {
  description = <<EOT
Map of workloads_sap_discovery_virtual_instances, attributes below
Required:
    - central_server_virtual_machine_id
    - environment
    - location
    - name
    - resource_group_name
    - sap_product
Optional:
    - managed_resource_group_name
    - managed_resources_network_access_type
    - managed_storage_account_name
    - tags
    - identity
EOT

  type = map(object({
    central_server_virtual_machine_id     = string
    environment                           = string
    location                              = string
    name                                  = string
    resource_group_name                   = string
    sap_product                           = string
    managed_resource_group_name           = optional(string)
    managed_resources_network_access_type = optional(string)
    managed_storage_account_name          = optional(string)
    tags                                  = optional(map(string))
    identity                              = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
  }))
}
