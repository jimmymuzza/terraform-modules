variable "memorydb_acls" {
  description = <<EOT
Map of memorydb_acls, attributes below
Optional:
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - user_names
EOT

  type = map(object({
    name        = optional(string)
    name_prefix = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    user_names  = optional(set(string))
  }))
}
