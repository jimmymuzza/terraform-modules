variable "redshift_hsm_configurations" {
  description = <<EOT
Map of redshift_hsm_configurations, attributes below
Required:
    - description
    - hsm_configuration_identifier
    - hsm_ip_address
    - hsm_partition_name
    - hsm_partition_password
    - hsm_server_public_certificate
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description                   = string
    hsm_configuration_identifier  = string
    hsm_ip_address                = string
    hsm_partition_name            = string
    hsm_partition_password        = string
    hsm_server_public_certificate = string
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
  }))
}
