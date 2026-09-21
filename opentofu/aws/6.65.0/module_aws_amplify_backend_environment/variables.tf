variable "amplify_backend_environments" {
  description = <<EOT
Map of amplify_backend_environments, attributes below
Required:
    - app_id
    - environment_name
Optional:
    - deployment_artifacts
    - region
    - stack_name
EOT

  type = map(object({
    app_id               = string
    environment_name     = string
    deployment_artifacts = optional(string)
    region               = optional(string)
    stack_name           = optional(string)
  }))
}
