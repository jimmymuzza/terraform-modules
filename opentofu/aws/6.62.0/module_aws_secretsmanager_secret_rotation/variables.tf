variable "secretsmanager_secret_rotations" {
  description = <<EOT
Map of secretsmanager_secret_rotations, attributes below
Required:
    - secret_id
Optional:
    - external_secret_rotation_role_arn
    - region
    - rotate_immediately
    - rotation_enabled
    - rotation_lambda_arn
    - external_secret_rotation_metadata
    - rotation_rules
EOT

  type = map(object({
    secret_id                         = string
    external_secret_rotation_role_arn = optional(string)
    region                            = optional(string)
    rotate_immediately                = optional(bool)
    rotation_enabled                  = optional(bool)
    rotation_lambda_arn               = optional(string)
    external_secret_rotation_metadata = optional(list(object({
            key   = string
            value = string
        })))
    rotation_rules                    = optional(list(object({
            automatically_after_days = optional(number)
            duration                 = optional(string)
            schedule_expression      = optional(string)
        })))
  }))
}
