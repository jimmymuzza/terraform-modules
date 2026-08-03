variable "docdb_subnet_groups" {
  description = <<EOT
Map of docdb_subnet_groups, attributes below
Required:
    - subnet_ids
Optional:
    - description
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    subnet_ids  = set(string)
    description = optional(string)
    name        = optional(string)
    name_prefix = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
