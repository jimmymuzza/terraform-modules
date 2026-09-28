variable "api_management_global_schemas" {
  description = <<EOT
Map of api_management_global_schemas, attributes below
Required:
    - api_management_name
    - resource_group_name
    - schema_id
    - type
    - value
Optional:
    - description
EOT

  type = map(object({
    api_management_name = string
    resource_group_name = string
    schema_id           = string
    type                = string
    value               = string
    description         = optional(string)
  }))
}
