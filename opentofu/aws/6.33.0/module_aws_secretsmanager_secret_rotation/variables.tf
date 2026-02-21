variable "secretsmanager_secret_rotations" {
  description = <<EOT
Map of secretsmanager_secret_rotations, attributes below
Required:
    - secret_id
    - rotation_rules
Optional:
    - region
    - rotate_immediately
    - rotation_lambda_arn
EOT

  type = map(object({
    secret_id           = string
    region              = optional(string)
    rotate_immediately  = optional(bool)
    rotation_lambda_arn = optional(string)
    rotation_rules      = list(object({
            automatically_after_days = optional(number)
            duration                 = optional(string)
            schedule_expression      = optional(string)
        }))
  }))
}
