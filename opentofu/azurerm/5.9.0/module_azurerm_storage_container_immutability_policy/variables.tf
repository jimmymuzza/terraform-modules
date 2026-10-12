variable "storage_container_immutability_policies" {
  description = <<EOT
Map of storage_container_immutability_policies, attributes below
Required:
    - immutability_period_in_days
    - storage_container_resource_manager_id
Optional:
    - locked
    - protected_append_writes_all_enabled
    - protected_append_writes_enabled
EOT

  type = map(object({
    immutability_period_in_days           = number
    storage_container_resource_manager_id = string
    locked                                = optional(bool)
    protected_append_writes_all_enabled   = optional(bool)
    protected_append_writes_enabled       = optional(bool)
  }))
}
