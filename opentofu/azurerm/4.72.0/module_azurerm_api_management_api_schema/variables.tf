variable "api_management_api_schemas" {
  description = <<EOT
Map of api_management_api_schemas, attributes below
Required:
    - api_management_name
    - api_name
    - content_type
    - resource_group_name
    - schema_id
Optional:
    - components
    - definitions
    - value
EOT

  type = map(object({
    api_management_name = string
    api_name            = string
    content_type        = string
    resource_group_name = string
    schema_id           = string
    components          = optional(string)
    definitions         = optional(string)
    value               = optional(string)
  }))
}
