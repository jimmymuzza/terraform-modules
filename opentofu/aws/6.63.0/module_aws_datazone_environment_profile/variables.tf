variable "datazone_environment_profiles" {
  description = <<EOT
Map of datazone_environment_profiles, attributes below
Required:
    - aws_account_region
    - domain_identifier
    - environment_blueprint_identifier
    - name
    - project_identifier
Optional:
    - aws_account_id
    - description
    - region
    - user_parameters
EOT

  type = map(object({
    aws_account_region               = string
    domain_identifier                = string
    environment_blueprint_identifier = string
    name                             = string
    project_identifier               = string
    aws_account_id                   = optional(string)
    description                      = optional(string)
    region                           = optional(string)
    user_parameters                  = optional(list(object({
            name  = optional(string)
            value = optional(string)
        })))
  }))
}
