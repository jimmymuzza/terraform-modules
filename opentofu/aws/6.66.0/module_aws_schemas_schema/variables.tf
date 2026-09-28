variable "schemas_schemas" {
  description = <<EOT
Map of schemas_schemas, attributes below
Required:
    - content
    - name
    - registry_name
    - type
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    content       = string
    name          = string
    registry_name = string
    type          = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
