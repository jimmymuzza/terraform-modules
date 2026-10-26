variable "finspace_kx_volumes" {
  description = <<EOT
Map of finspace_kx_volumes, attributes below
Required:
    - availability_zones
    - az_mode
    - environment_id
    - name
    - type
Optional:
    - description
    - region
    - tags
    - tags_all
    - nas1_configuration
EOT

  type = map(object({
    availability_zones = list(string)
    az_mode            = string
    environment_id     = string
    name               = string
    type               = string
    description        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    nas1_configuration = optional(list(object({
            size = number
            type = string
        })))
  }))
}
