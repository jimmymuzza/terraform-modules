variable "detective_graphs" {
  description = <<EOT
Map of detective_graphs, attributes below
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
