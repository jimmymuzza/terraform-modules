variable "cognito_resource_servers" {
  description = <<EOT
Map of cognito_resource_servers, attributes below
Required:
    - identifier
    - name
    - user_pool_id
Optional:
    - region
    - scope
EOT

  type = map(object({
    identifier   = string
    name         = string
    user_pool_id = string
    region       = optional(string)
    scope        = optional(set(object({
            scope_description = string
            scope_name        = string
        })))
  }))
}
