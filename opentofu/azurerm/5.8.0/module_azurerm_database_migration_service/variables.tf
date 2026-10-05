variable "database_migration_services" {
  description = <<EOT
Map of database_migration_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - subnet_id
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    subnet_id           = string
    tags                = optional(map(string))
  }))
}
