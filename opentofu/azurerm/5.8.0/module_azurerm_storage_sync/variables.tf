variable "storage_syncs" {
  description = <<EOT
Map of storage_syncs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - incoming_traffic_policy
    - tags
EOT

  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    incoming_traffic_policy = optional(string)
    tags                    = optional(map(string))
  }))
}
