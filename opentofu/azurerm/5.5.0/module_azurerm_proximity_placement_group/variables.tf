variable "proximity_placement_groups" {
  description = <<EOT
Map of proximity_placement_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - allowed_vm_sizes
    - tags
    - zone
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    allowed_vm_sizes    = optional(set(string))
    tags                = optional(map(string))
    zone                = optional(string)
  }))
}
