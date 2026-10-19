variable "data_factory_managed_private_endpoints" {
  description = <<EOT
Map of data_factory_managed_private_endpoints, attributes below
Required:
    - data_factory_id
    - name
    - target_resource_id
Optional:
    - fqdns
    - subresource_name
EOT

  type = map(object({
    data_factory_id    = string
    name               = string
    target_resource_id = string
    fqdns              = optional(list(string))
    subresource_name   = optional(string)
  }))
}
