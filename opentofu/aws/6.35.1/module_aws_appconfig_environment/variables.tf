variable "appconfig_environments" {
  description = <<EOT
Map of appconfig_environments, attributes below
Required:
    - application_id
    - name
Optional:
    - description
    - region
    - tags
    - monitor
EOT

  type = map(object({
    application_id = string
    name           = string
    description    = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    monitor        = optional(set(object({
            alarm_arn      = string
            alarm_role_arn = optional(string)
        })))
  }))
}
