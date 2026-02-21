variable "ec2_client_vpn_endpoints" {
  description = <<EOT
Map of ec2_client_vpn_endpoints, attributes below
Required:
    - server_certificate_arn
    - authentication_options
    - connection_log_options
Optional:
    - client_cidr_block
    - description
    - disconnect_on_session_timeout
    - dns_servers
    - endpoint_ip_address_type
    - region
    - security_group_ids
    - self_service_portal
    - session_timeout_hours
    - split_tunnel
    - tags
    - tags_all
    - traffic_ip_address_type
    - transport_protocol
    - vpc_id
    - vpn_port
    - client_connect_options
    - client_login_banner_options
    - client_route_enforcement_options
EOT

  type = map(object({
    server_certificate_arn           = string
    client_cidr_block                = optional(string)
    description                      = optional(string)
    disconnect_on_session_timeout    = optional(bool)
    dns_servers                      = optional(list(string))
    endpoint_ip_address_type         = optional(string)
    region                           = optional(string)
    security_group_ids               = optional(set(string))
    self_service_portal              = optional(string)
    session_timeout_hours            = optional(number)
    split_tunnel                     = optional(bool)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    traffic_ip_address_type          = optional(string)
    transport_protocol               = optional(string)
    vpc_id                           = optional(string)
    vpn_port                         = optional(number)
    authentication_options           = set(object({
            type                           = string
            active_directory_id            = optional(string)
            root_certificate_chain_arn     = optional(string)
            saml_provider_arn              = optional(string)
            self_service_saml_provider_arn = optional(string)
        }))
    client_connect_options           = optional(list(object({
            enabled             = optional(bool)
            lambda_function_arn = optional(string)
        })))
    client_login_banner_options      = optional(list(object({
            banner_text = optional(string)
            enabled     = optional(bool)
        })))
    client_route_enforcement_options = optional(list(object({
            enforced = optional(bool)
        })))
    connection_log_options           = list(object({
            enabled               = bool
            cloudwatch_log_group  = optional(string)
            cloudwatch_log_stream = optional(string)
        }))
  }))
}
