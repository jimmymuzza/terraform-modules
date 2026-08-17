variable "monitor_data_collection_endpoints" {
  description = <<EOT
Map of monitor_data_collection_endpoints, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - kind
    - public_network_access_enabled
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    description                   = optional(string)
    kind                          = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
  }))
}
