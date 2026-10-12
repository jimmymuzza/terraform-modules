variable "cloudformation_types" {
  description = <<EOT
Map of cloudformation_types, attributes below
Required:
    - schema_handler_package
    - type_name
Optional:
    - execution_role_arn
    - region
    - type
    - logging_config
EOT

  type = map(object({
    schema_handler_package = string
    type_name              = string
    execution_role_arn     = optional(string)
    region                 = optional(string)
    type                   = optional(string)
    logging_config         = optional(list(object({
            log_group_name = string
            log_role_arn   = string
        })))
  }))
}
