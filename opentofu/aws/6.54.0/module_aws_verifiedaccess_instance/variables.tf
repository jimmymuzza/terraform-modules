variable "verifiedaccess_instances" {
  description = <<EOT
Map of verifiedaccess_instances, attributes below
Optional:
    - cidr_endpoints_custom_subdomain
    - description
    - fips_enabled
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cidr_endpoints_custom_subdomain = optional(string)
    description                     = optional(string)
    fips_enabled                    = optional(bool)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
}
