variable "vpc_ipams" {
  description = <<EOT
Map of vpc_ipams, attributes below
Required:
    - operating_regions
Optional:
    - cascade
    - description
    - enable_private_gua
    - metered_account
    - region
    - tags
    - tags_all
    - tier
EOT

  type = map(object({
    cascade            = optional(bool)
    description        = optional(string)
    enable_private_gua = optional(bool)
    metered_account    = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    tier               = optional(string)
    operating_regions  = set(object({
            region_name = string
        }))
  }))
}
