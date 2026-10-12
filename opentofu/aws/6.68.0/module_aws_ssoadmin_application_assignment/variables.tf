variable "ssoadmin_application_assignments" {
  description = <<EOT
Map of ssoadmin_application_assignments, attributes below
Required:
    - application_arn
    - principal_id
    - principal_type
Optional:
    - region
EOT

  type = map(object({
    application_arn = string
    principal_id    = string
    principal_type  = string
    region          = optional(string)
  }))
}
