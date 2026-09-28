variable "timestreamwrite_databases" {
  description = <<EOT
Map of timestreamwrite_databases, attributes below
Required:
    - database_name
Optional:
    - kms_key_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    database_name = string
    kms_key_id    = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
