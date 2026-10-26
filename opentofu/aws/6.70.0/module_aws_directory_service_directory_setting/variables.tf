variable "directory_service_directory_settings" {
  description = <<EOT
Map of directory_service_directory_settings, attributes below
Required:
    - directory_id
    - name
    - value
Optional:
    - region
EOT

  type = map(object({
    directory_id = string
    name         = string
    value        = string
    region       = optional(string)
  }))
}
