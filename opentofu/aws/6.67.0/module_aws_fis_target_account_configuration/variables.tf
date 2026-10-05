variable "fis_target_account_configurations" {
  description = <<EOT
Map of fis_target_account_configurations, attributes below
Required:
    - account_id
    - experiment_template_id
Optional:
    - description
    - region
    - role_arn
EOT

  type = map(object({
    account_id             = string
    experiment_template_id = string
    description            = optional(string)
    region                 = optional(string)
    role_arn               = optional(string)
  }))
}
