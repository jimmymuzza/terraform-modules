variable "database_migration_projects" {
  description = <<EOT
Map of database_migration_projects, attributes below
Required:
    - location
    - name
    - resource_group_name
    - service_name
    - source_platform
    - target_platform
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    service_name        = string
    source_platform     = string
    target_platform     = string
    tags                = optional(map(string))
  }))
}
