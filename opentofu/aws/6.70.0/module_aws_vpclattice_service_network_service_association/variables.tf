variable "vpclattice_service_network_service_associations" {
  description = <<EOT
Map of vpclattice_service_network_service_associations, attributes below
Required:
    - service_identifier
    - service_network_identifier
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    service_identifier         = string
    service_network_identifier = string
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
