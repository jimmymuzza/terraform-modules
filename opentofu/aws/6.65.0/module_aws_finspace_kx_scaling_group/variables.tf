variable "finspace_kx_scaling_groups" {
  description = <<EOT
Map of finspace_kx_scaling_groups, attributes below
Required:
    - availability_zone_id
    - environment_id
    - host_type
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    availability_zone_id = string
    environment_id       = string
    host_type            = string
    name                 = string
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
