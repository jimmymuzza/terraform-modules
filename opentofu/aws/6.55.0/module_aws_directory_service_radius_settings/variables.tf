variable "directory_service_radius_settings" {
  description = <<EOT
Map of directory_service_radius_settings, attributes below
Required:
    - authentication_protocol
    - directory_id
    - display_label
    - radius_port
    - radius_retries
    - radius_servers
    - radius_timeout
    - shared_secret
Optional:
    - region
    - use_same_username
EOT

  type = map(object({
    authentication_protocol = string
    directory_id            = string
    display_label           = string
    radius_port             = number
    radius_retries          = number
    radius_servers          = set(string)
    radius_timeout          = number
    shared_secret           = string
    region                  = optional(string)
    use_same_username       = optional(bool)
  }))
}
