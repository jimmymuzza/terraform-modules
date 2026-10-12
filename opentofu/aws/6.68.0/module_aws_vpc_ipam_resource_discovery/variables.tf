variable "vpc_ipam_resource_discoveries" {
  description = <<EOT
Map of vpc_ipam_resource_discoveries, attributes below
Required:
    - operating_regions
Optional:
    - description
    - region
    - tags
    - tags_all
    - organizational_unit_exclusion
EOT

  type = map(object({
    description                   = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    operating_regions             = set(object({
            region_name = string
        }))
    organizational_unit_exclusion = optional(set(object({
            organizations_entity_path = string
        })))
  }))
}
