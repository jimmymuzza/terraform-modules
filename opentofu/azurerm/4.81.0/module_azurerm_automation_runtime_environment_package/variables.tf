variable "automation_runtime_environment_packages" {
  description = <<EOT
Map of automation_runtime_environment_packages, attributes below
Required:
    - automation_runtime_environment_id
    - content_uri
    - name
Optional:
    - content_version
    - hash_algorithm
    - hash_value
EOT

  type = map(object({
    automation_runtime_environment_id = string
    content_uri                       = string
    name                              = string
    content_version                   = optional(string)
    hash_algorithm                    = optional(string)
    hash_value                        = optional(string)
  }))
}
