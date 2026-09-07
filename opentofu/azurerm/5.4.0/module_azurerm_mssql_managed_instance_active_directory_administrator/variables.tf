variable "mssql_managed_instance_active_directory_administrators" {
  description = <<EOT
Map of mssql_managed_instance_active_directory_administrators, attributes below
Required:
    - login_username
    - managed_instance_id
    - object_id
    - tenant_id
Optional:
    - azuread_authentication_only
EOT

  type = map(object({
    login_username              = string
    managed_instance_id         = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = optional(bool)
  }))
}
