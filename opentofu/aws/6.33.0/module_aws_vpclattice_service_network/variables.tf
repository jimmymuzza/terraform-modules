variable "vpclattice_service_networks" {
  description = <<EOT
Map of vpclattice_service_networks, attributes below
Required:
    - name
Optional:
    - auth_type
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name      = string
    auth_type = optional(string)
    region    = optional(string)
    tags      = optional(map(string))
    tags_all  = optional(map(string))
  }))
}
