variable "redshift_subnet_groups" {
  description = <<EOT
Map of redshift_subnet_groups, attributes below
Required:
    - name
    - subnet_ids
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    subnet_ids  = set(string)
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
