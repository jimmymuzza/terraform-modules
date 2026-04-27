variable "restore_point_collections" {
  description = <<EOT
Map of restore_point_collections, attributes below
Required:
    - location
    - name
    - resource_group_name
    - source_virtual_machine_id
Optional:
    - tags
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    source_virtual_machine_id = string
    tags                      = optional(map(string))
  }))
}
