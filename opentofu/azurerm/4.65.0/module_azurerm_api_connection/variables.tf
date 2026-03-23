variable "api_connections" {
  description = <<EOT
Map of api_connections, attributes below
Required:
    - managed_api_id
    - name
    - resource_group_name
Optional:
    - display_name
    - parameter_values
    - tags
EOT

  type = map(object({
    managed_api_id      = string
    name                = string
    resource_group_name = string
    display_name        = optional(string)
    parameter_values    = optional(map(string))
    tags                = optional(map(string))
  }))
}
