variable "db_proxies" {
  description = <<EOT
Map of db_proxies, attributes below
Required:
    - engine_family
    - name
    - role_arn
    - vpc_subnet_ids
Optional:
    - debug_logging
    - default_auth_scheme
    - endpoint_network_type
    - idle_client_timeout
    - region
    - require_tls
    - tags
    - tags_all
    - target_connection_network_type
    - vpc_security_group_ids
    - auth
EOT

  type = map(object({
    engine_family                  = string
    name                           = string
    role_arn                       = string
    vpc_subnet_ids                 = set(string)
    debug_logging                  = optional(bool)
    default_auth_scheme            = optional(string)
    endpoint_network_type          = optional(string)
    idle_client_timeout            = optional(number)
    region                         = optional(string)
    require_tls                    = optional(bool)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    target_connection_network_type = optional(string)
    vpc_security_group_ids         = optional(set(string))
    auth                           = optional(set(object({
            auth_scheme               = optional(string)
            client_password_auth_type = optional(string)
            description               = optional(string)
            iam_auth                  = optional(string)
            secret_arn                = optional(string)
            username                  = optional(string)
        })))
  }))
}
