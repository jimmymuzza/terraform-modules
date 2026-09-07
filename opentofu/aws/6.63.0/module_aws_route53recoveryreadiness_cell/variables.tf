variable "route53recoveryreadiness_cells" {
  description = <<EOT
Map of route53recoveryreadiness_cells, attributes below
Required:
    - cell_name
Optional:
    - cells
    - tags
    - tags_all
EOT

  type = map(object({
    cell_name = string
    cells     = optional(list(string))
    tags      = optional(map(string))
    tags_all  = optional(map(string))
  }))
}
