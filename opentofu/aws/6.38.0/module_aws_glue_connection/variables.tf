variable "glue_connections" {
  description = <<EOT
Map of glue_connections, attributes below
Required:
    - name
Optional:
    - athena_properties
    - catalog_id
    - connection_properties
    - connection_type
    - description
    - match_criteria
    - region
    - tags
    - tags_all
    - physical_connection_requirements
EOT

  type = map(object({
    name                             = string
    athena_properties                = optional(map(string))
    catalog_id                       = optional(string)
    connection_properties            = optional(map(string))
    connection_type                  = optional(string)
    description                      = optional(string)
    match_criteria                   = optional(list(string))
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    physical_connection_requirements = optional(list(object({
            availability_zone      = optional(string)
            security_group_id_list = optional(set(string))
            subnet_id              = optional(string)
        })))
  }))
}
