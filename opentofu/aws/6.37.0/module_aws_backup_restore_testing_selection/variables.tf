variable "backup_restore_testing_selections" {
  description = <<EOT
Map of backup_restore_testing_selections, attributes below
Required:
    - iam_role_arn
    - name
    - protected_resource_type
    - restore_testing_plan_name
Optional:
    - protected_resource_arns
    - region
    - restore_metadata_overrides
    - validation_window_hours
    - protected_resource_conditions
EOT

  type = map(object({
    iam_role_arn                  = string
    name                          = string
    protected_resource_type       = string
    restore_testing_plan_name     = string
    protected_resource_arns       = optional(set(string))
    region                        = optional(string)
    restore_metadata_overrides    = optional(map(string))
    validation_window_hours       = optional(number)
    protected_resource_conditions = optional(list(object({
            string_equals     = optional(list(object({
                key   = string
                value = string
            })))
            string_not_equals = optional(list(object({
                key   = string
                value = string
            })))
        })))
  }))
}
