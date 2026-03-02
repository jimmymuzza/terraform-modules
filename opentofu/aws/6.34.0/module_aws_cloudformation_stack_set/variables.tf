variable "cloudformation_stack_sets" {
  description = <<EOT
Map of cloudformation_stack_sets, attributes below
Required:
    - name
Optional:
    - administration_role_arn
    - call_as
    - capabilities
    - description
    - execution_role_name
    - parameters
    - permission_model
    - region
    - tags
    - tags_all
    - template_body
    - template_url
    - auto_deployment
    - managed_execution
    - operation_preferences
EOT

  type = map(object({
    name                    = string
    administration_role_arn = optional(string)
    call_as                 = optional(string)
    capabilities            = optional(set(string))
    description             = optional(string)
    execution_role_name     = optional(string)
    parameters              = optional(map(string))
    permission_model        = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    template_body           = optional(string)
    template_url            = optional(string)
    auto_deployment         = optional(list(object({
            enabled                          = optional(bool)
            retain_stacks_on_account_removal = optional(bool)
        })))
    managed_execution       = optional(list(object({
            active = optional(bool)
        })))
    operation_preferences   = optional(list(object({
            failure_tolerance_count      = optional(number)
            failure_tolerance_percentage = optional(number)
            max_concurrent_count         = optional(number)
            max_concurrent_percentage    = optional(number)
            region_concurrency_type      = optional(string)
            region_order                 = optional(list(string))
        })))
  }))
}
