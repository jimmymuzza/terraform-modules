variable "licensemanager_license_configurations" {
  description = <<EOT
Map of licensemanager_license_configurations, attributes below
Required:
    - license_counting_type
    - name
Optional:
    - description
    - license_count
    - license_count_hard_limit
    - license_rules
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    license_counting_type    = string
    name                     = string
    description              = optional(string)
    license_count            = optional(number)
    license_count_hard_limit = optional(bool)
    license_rules            = optional(list(string))
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
  }))
}
