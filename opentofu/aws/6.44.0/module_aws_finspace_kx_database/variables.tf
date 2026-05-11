variable "finspace_kx_databases" {
  description = <<EOT
Map of finspace_kx_databases, attributes below
Required:
    - environment_id
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    environment_id = string
    name           = string
    description    = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
  }))
}
