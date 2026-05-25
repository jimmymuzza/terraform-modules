variable "eventhub_clusters" {
  description = <<EOT
Map of eventhub_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    tags                = optional(map(string))
  }))
}
