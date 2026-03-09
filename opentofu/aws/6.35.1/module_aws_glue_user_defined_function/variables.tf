variable "glue_user_defined_functions" {
  description = <<EOT
Map of glue_user_defined_functions, attributes below
Required:
    - class_name
    - database_name
    - name
    - owner_name
    - owner_type
Optional:
    - catalog_id
    - region
    - resource_uris
EOT

  type = map(object({
    class_name    = string
    database_name = string
    name          = string
    owner_name    = string
    owner_type    = string
    catalog_id    = optional(string)
    region        = optional(string)
    resource_uris = optional(set(object({
            resource_type = string
            uri           = string
        })))
  }))
}
