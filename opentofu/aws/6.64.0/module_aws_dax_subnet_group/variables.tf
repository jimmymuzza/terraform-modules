variable "dax_subnet_groups" {
  description = <<EOT
Map of dax_subnet_groups, attributes below
Required:
    - name
    - subnet_ids
Optional:
    - description
    - region
EOT

  type = map(object({
    name        = string
    subnet_ids  = set(string)
    description = optional(string)
    region      = optional(string)
  }))
}
