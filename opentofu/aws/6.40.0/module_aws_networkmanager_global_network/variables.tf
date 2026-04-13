variable "networkmanager_global_networks" {
  description = <<EOT
Map of networkmanager_global_networks, attributes below
Optional:
    - description
    - tags
    - tags_all
EOT

  type = map(object({
    description = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
