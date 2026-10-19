variable "datazone_environment_blueprint_configurations" {
  description = <<EOT
Map of datazone_environment_blueprint_configurations, attributes below
Required:
    - domain_id
    - enabled_regions
    - environment_blueprint_id
Optional:
    - global_parameters
    - manage_access_role_arn
    - provisioning_role_arn
    - region
    - regional_parameters
EOT

  type = map(object({
    domain_id                = string
    enabled_regions          = list(string)
    environment_blueprint_id = string
    global_parameters        = optional(map(string))
    manage_access_role_arn   = optional(string)
    provisioning_role_arn    = optional(string)
    region                   = optional(string)
    regional_parameters      = optional(map(map(string)))
  }))
}
