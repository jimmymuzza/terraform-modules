variable "service_principal_passwords" {
  description = <<EOT
Map of service_principal_passwords, attributes below
Required:
    - service_principal_id
Optional:
    - display_name
    - end_date
    - end_date_relative
    - rotate_when_changed
    - start_date
EOT

  type = map(object({
    service_principal_id = string
    display_name         = optional(string)
    end_date             = optional(string)
    end_date_relative    = optional(string)
    rotate_when_changed  = optional(map(string))
    start_date           = optional(string)
  }))
}
