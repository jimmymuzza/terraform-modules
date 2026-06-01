variable "dedicated_host_groups" {
  description = <<EOT
Map of dedicated_host_groups, attributes below
Required:
    - location
    - name
    - platform_fault_domain_count
    - resource_group_name
Optional:
    - automatic_placement_enabled
    - tags
    - zone
EOT

  type = map(object({
    location                    = string
    name                        = string
    platform_fault_domain_count = number
    resource_group_name         = string
    automatic_placement_enabled = optional(bool)
    tags                        = optional(map(string))
    zone                        = optional(string)
  }))
}
