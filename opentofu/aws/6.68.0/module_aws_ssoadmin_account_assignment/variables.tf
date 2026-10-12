variable "ssoadmin_account_assignments" {
  description = <<EOT
Map of ssoadmin_account_assignments, attributes below
Required:
    - instance_arn
    - permission_set_arn
    - principal_id
    - principal_type
    - target_id
    - target_type
Optional:
    - region
EOT

  type = map(object({
    instance_arn       = string
    permission_set_arn = string
    principal_id       = string
    principal_type     = string
    target_id          = string
    target_type        = string
    region             = optional(string)
  }))
}
