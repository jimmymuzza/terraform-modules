variable "transfer_connectors" {
  description = <<EOT
Map of transfer_connectors, attributes below
Required:
    - access_role
Optional:
    - logging_role
    - region
    - security_policy_name
    - tags
    - tags_all
    - url
    - as2_config
    - egress_config
    - sftp_config
EOT

  type = map(object({
    access_role          = string
    logging_role         = optional(string)
    region               = optional(string)
    security_policy_name = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    url                  = optional(string)
    as2_config           = optional(list(object({
            compression           = string
            encryption_algorithm  = string
            local_profile_id      = string
            mdn_response          = string
            partner_profile_id    = string
            signing_algorithm     = string
            mdn_signing_algorithm = optional(string)
            message_subject       = optional(string)
        })))
    egress_config        = optional(list(object({
            vpc_lattice = optional(list(object({
                resource_configuration_arn = string
                port_number                = optional(number)
            })))
        })))
    sftp_config          = optional(list(object({
            trusted_host_keys = optional(set(string))
            user_secret_id    = optional(string)
        })))
  }))
}
