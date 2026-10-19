variable "appconfig_deployment_strategies" {
  description = <<EOT
Map of appconfig_deployment_strategies, attributes below
Required:
    - deployment_duration_in_minutes
    - growth_factor
    - name
    - replicate_to
Optional:
    - description
    - final_bake_time_in_minutes
    - growth_type
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    deployment_duration_in_minutes = number
    growth_factor                  = number
    name                           = string
    replicate_to                   = string
    description                    = optional(string)
    final_bake_time_in_minutes     = optional(number)
    growth_type                    = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
  }))
}
