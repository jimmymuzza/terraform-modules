variable "storage_account_network_rules" {
  description = <<EOT
Map of storage_account_network_rules, attributes below
Required:
    - default_action
    - storage_account_id
Optional:
    - bypass
    - ip_rules
    - virtual_network_subnet_ids
    - private_link_access
EOT

  type = map(object({
    default_action             = string
    storage_account_id         = string
    bypass                     = optional(set(string))
    ip_rules                   = optional(set(string))
    virtual_network_subnet_ids = optional(set(string))
    private_link_access        = optional(list(object({
            endpoint_resource_id = string
            endpoint_tenant_id   = optional(string)
        })))
  }))
}
