variable "data_factory_integration_runtime_azures" {
  description = <<EOT
Map of data_factory_integration_runtime_azures, attributes below
Required:
    - data_factory_id
    - location
    - name
Optional:
    - cleanup_enabled
    - compute_type
    - core_count
    - description
    - time_to_live_min
    - virtual_network_enabled
EOT

  type = map(object({
    data_factory_id         = string
    location                = string
    name                    = string
    cleanup_enabled         = optional(bool)
    compute_type            = optional(string)
    core_count              = optional(number)
    description             = optional(string)
    time_to_live_min        = optional(number)
    virtual_network_enabled = optional(bool)
  }))
}
