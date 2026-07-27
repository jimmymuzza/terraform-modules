variable "cosmosdb_sql_role_assignments" {
  description = <<EOT
Map of cosmosdb_sql_role_assignments, attributes below
Required:
    - account_name
    - principal_id
    - resource_group_name
    - role_definition_id
    - scope
Optional:
    - name
EOT

  type = map(object({
    account_name        = string
    principal_id        = string
    resource_group_name = string
    role_definition_id  = string
    scope               = string
    name                = optional(string)
  }))
}
