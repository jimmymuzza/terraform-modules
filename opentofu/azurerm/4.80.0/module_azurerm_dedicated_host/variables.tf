variable "dedicated_hosts" {
  description = <<EOT
Map of dedicated_hosts, attributes below
Required:
    - dedicated_host_group_id
    - location
    - name
    - platform_fault_domain
    - sku_name
Optional:
    - auto_replace_on_failure
    - license_type
    - tags
EOT

  type = map(object({
    dedicated_host_group_id = string
    location                = string
    name                    = string
    platform_fault_domain   = number
    sku_name                = string
    auto_replace_on_failure = optional(bool)
    license_type            = optional(string)
    tags                    = optional(map(string))
  }))
}
