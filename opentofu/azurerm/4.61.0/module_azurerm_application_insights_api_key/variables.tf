variable "application_insights_api_keys" {
  description = <<EOT
Map of application_insights_api_keys, attributes below
Required:
    - application_insights_id
    - name
Optional:
    - read_permissions
    - write_permissions
EOT

  type = map(object({
    application_insights_id = string
    name                    = string
    read_permissions        = optional(set(string))
    write_permissions       = optional(set(string))
  }))
}
