variable "appstream_directory_configs" {
  description = <<EOT
Map of appstream_directory_configs, attributes below
Required:
    - directory_name
    - organizational_unit_distinguished_names
    - service_account_credentials
Optional:
    - region
    - certificate_based_auth_properties
EOT

  type = map(object({
    directory_name                          = string
    organizational_unit_distinguished_names = set(string)
    region                                  = optional(string)
    certificate_based_auth_properties       = optional(list(object({
            certificate_authority_arn = optional(string)
            status                    = optional(string)
        })))
    service_account_credentials             = list(object({
            account_name     = string
            account_password = string
        }))
  }))
}
