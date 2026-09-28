variable "elastic_beanstalk_configuration_templates" {
  description = <<EOT
Map of elastic_beanstalk_configuration_templates, attributes below
Required:
    - application
    - name
Optional:
    - description
    - environment_id
    - region
    - solution_stack_name
    - setting
EOT

  type = map(object({
    application         = string
    name                = string
    description         = optional(string)
    environment_id      = optional(string)
    region              = optional(string)
    solution_stack_name = optional(string)
    setting             = optional(set(object({
            name      = string
            namespace = string
            value     = string
            resource  = optional(string)
        })))
  }))
}
