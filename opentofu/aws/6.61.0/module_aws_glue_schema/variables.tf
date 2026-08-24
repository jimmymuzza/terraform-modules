variable "glue_schemas" {
  description = <<EOT
Map of glue_schemas, attributes below
Required:
    - compatibility
    - data_format
    - schema_definition
    - schema_name
Optional:
    - description
    - region
    - registry_arn
    - tags
    - tags_all
EOT

  type = map(object({
    compatibility     = string
    data_format       = string
    schema_definition = string
    schema_name       = string
    description       = optional(string)
    region            = optional(string)
    registry_arn      = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
