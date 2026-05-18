variable "ssmquicksetup_configuration_managers" {
  description = <<EOT
Map of ssmquicksetup_configuration_managers, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - configuration_definition
EOT

  type = map(object({
    name                     = string
    description              = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    configuration_definition = optional(list(object({
            parameters                               = map(string)
            type                                     = string
            local_deployment_administration_role_arn = optional(string)
            local_deployment_execution_role_name     = optional(string)
            type_version                             = optional(string)
        })))
  }))
}
