variable "vpc_ipam_resource_discovery_associations" {
  description = <<EOT
Map of vpc_ipam_resource_discovery_associations, attributes below
Required:
    - ipam_id
    - ipam_resource_discovery_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    ipam_id                    = string
    ipam_resource_discovery_id = string
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
