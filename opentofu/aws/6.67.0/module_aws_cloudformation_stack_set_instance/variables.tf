variable "cloudformation_stack_set_instances" {
  description = <<EOT
Map of cloudformation_stack_set_instances, attributes below
Required:
    - stack_set_name
Optional:
    - account_id
    - call_as
    - parameter_overrides
    - region
    - retain_stack
    - stack_set_instance_region
    - deployment_targets
    - operation_preferences
EOT

  type = map(object({
    stack_set_name            = string
    account_id                = optional(string)
    call_as                   = optional(string)
    parameter_overrides       = optional(map(string))
    region                    = optional(string)
    retain_stack              = optional(bool)
    stack_set_instance_region = optional(string)
    deployment_targets        = optional(list(object({
            account_filter_type     = optional(string)
            accounts                = optional(set(string))
            accounts_url            = optional(string)
            organizational_unit_ids = optional(set(string))
        })))
    operation_preferences     = optional(list(object({
            concurrency_mode             = optional(string)
            failure_tolerance_count      = optional(number)
            failure_tolerance_percentage = optional(number)
            max_concurrent_count         = optional(number)
            max_concurrent_percentage    = optional(number)
            region_concurrency_type      = optional(string)
            region_order                 = optional(list(string))
        })))
  }))
}
