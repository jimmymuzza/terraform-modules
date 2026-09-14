variable "config_configuration_recorder_status" {
  description = <<EOT
Map of config_configuration_recorder_status, attributes below
Required:
    - is_enabled
    - name
Optional:
    - region
EOT

  type = map(object({
    is_enabled = bool
    name       = string
    region     = optional(string)
  }))
}
