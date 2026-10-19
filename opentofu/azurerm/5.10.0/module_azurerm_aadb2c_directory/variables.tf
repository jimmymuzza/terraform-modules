variable "aadb2c_directories" {
  description = <<EOT
Map of aadb2c_directories, attributes below
Required:
    - data_residency_location
    - domain_name
    - resource_group_name
    - sku_name
Optional:
    - country_code
    - display_name
    - tags
EOT

  type = map(object({
    data_residency_location = string
    domain_name             = string
    resource_group_name     = string
    sku_name                = string
    country_code            = optional(string)
    display_name            = optional(string)
    tags                    = optional(map(string))
  }))
}
