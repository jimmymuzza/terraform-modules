variable "lightsail_container_services" {
  description = <<EOT
Map of lightsail_container_services, attributes below
Required:
    - name
    - power
    - scale
Optional:
    - is_disabled
    - region
    - tags
    - tags_all
    - private_registry_access
    - public_domain_names
EOT

  type = map(object({
    name                    = string
    power                   = string
    scale                   = number
    is_disabled             = optional(bool)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    private_registry_access = optional(list(object({
            ecr_image_puller_role = optional(list(object({
                is_active = optional(bool)
            })))
        })))
    public_domain_names     = optional(list(object({
            certificate = set(object({
                certificate_name = string
                domain_names     = list(string)
            }))
        })))
  }))
}
