variable "m2_deployments" {
  description = <<EOT
Map of m2_deployments, attributes below
Required:
    - application_id
    - application_version
    - environment_id
    - start
Optional:
    - force_stop
    - region
EOT

  type = map(object({
    application_id      = string
    application_version = number
    environment_id      = string
    start               = bool
    force_stop          = optional(bool)
    region              = optional(string)
  }))
}
