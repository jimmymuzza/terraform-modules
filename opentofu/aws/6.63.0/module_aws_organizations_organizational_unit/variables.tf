variable "organizations_organizational_units" {
  description = <<EOT
Map of organizations_organizational_units, attributes below
Required:
    - name
    - parent_id
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    name      = string
    parent_id = string
    tags      = optional(map(string))
    tags_all  = optional(map(string))
  }))
}
