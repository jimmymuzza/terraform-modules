variable "capacity_reservation_groups" {
  description = <<EOT
Map of capacity_reservation_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - zones
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    zones               = optional(set(string))
  }))
}
