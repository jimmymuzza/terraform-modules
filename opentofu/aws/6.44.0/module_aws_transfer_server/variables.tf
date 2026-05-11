variable "transfer_servers" {
  description = <<EOT
Map of transfer_servers, attributes below
Optional:
    - certificate
    - directory_id
    - domain
    - endpoint_type
    - force_destroy
    - function
    - host_key
    - identity_provider_type
    - invocation_role
    - logging_role
    - post_authentication_login_banner
    - pre_authentication_login_banner
    - protocols
    - region
    - security_policy_name
    - sftp_authentication_methods
    - structured_log_destinations
    - tags
    - tags_all
    - url
    - endpoint_details
    - protocol_details
    - s3_storage_options
    - workflow_details
EOT

  type = map(object({
    certificate                      = optional(string)
    directory_id                     = optional(string)
    domain                           = optional(string)
    endpoint_type                    = optional(string)
    force_destroy                    = optional(bool)
    function                         = optional(string)
    host_key                         = optional(string)
    identity_provider_type           = optional(string)
    invocation_role                  = optional(string)
    logging_role                     = optional(string)
    post_authentication_login_banner = optional(string)
    pre_authentication_login_banner  = optional(string)
    protocols                        = optional(set(string))
    region                           = optional(string)
    security_policy_name             = optional(string)
    sftp_authentication_methods      = optional(string)
    structured_log_destinations      = optional(set(string))
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    url                              = optional(string)
    endpoint_details                 = optional(list(object({
            address_allocation_ids = optional(set(string))
            security_group_ids     = optional(set(string))
            subnet_ids             = optional(set(string))
            vpc_endpoint_id        = optional(string)
            vpc_id                 = optional(string)
        })))
    protocol_details                 = optional(list(object({
            as2_transports              = optional(set(string))
            passive_ip                  = optional(string)
            set_stat_option             = optional(string)
            tls_session_resumption_mode = optional(string)
        })))
    s3_storage_options               = optional(list(object({
            directory_listing_optimization = optional(string)
        })))
    workflow_details                 = optional(list(object({
            on_partial_upload = optional(list(object({
                execution_role = string
                workflow_id    = string
            })))
            on_upload         = optional(list(object({
                execution_role = string
                workflow_id    = string
            })))
        })))
  }))
}
