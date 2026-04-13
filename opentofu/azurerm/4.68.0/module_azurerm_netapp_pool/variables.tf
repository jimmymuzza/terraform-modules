variable "netapp_pools" {
  description = <<EOT
Map of netapp_pools, attributes below
Required:
    - account_name
    - location
    - name
    - resource_group_name
    - service_level
    - size_in_tb
Optional:
    - cool_access_enabled
    - custom_throughput_mibps
    - encryption_type
    - qos_type
    - tags
EOT

  type = map(object({
    account_name            = string
    location                = string
    name                    = string
    resource_group_name     = string
    service_level           = string
    size_in_tb              = number
    cool_access_enabled     = optional(bool)
    custom_throughput_mibps = optional(number)
    encryption_type         = optional(string)
    qos_type                = optional(string)
    tags                    = optional(map(string))
  }))
}
