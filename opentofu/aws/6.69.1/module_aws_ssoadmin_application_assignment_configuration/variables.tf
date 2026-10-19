variable "ssoadmin_application_assignment_configurations" {
  description = <<EOT
Map of ssoadmin_application_assignment_configurations, attributes below
Required:
    - application_arn
    - assignment_required
Optional:
    - region
EOT

  type = map(object({
    application_arn     = string
    assignment_required = bool
    region              = optional(string)
  }))
}
