variable "sagemaker_workforces" {
  description = <<EOT
Map of sagemaker_workforces, attributes below
Required:
    - workforce_name
Optional:
    - region
    - cognito_config
    - oidc_config
    - source_ip_config
    - workforce_vpc_config
EOT

  type = map(object({
    workforce_name       = string
    region               = optional(string)
    cognito_config       = optional(list(object({
            client_id = string
            user_pool = string
        })))
    oidc_config          = optional(list(object({
            authorization_endpoint              = string
            client_id                           = string
            client_secret                       = string
            issuer                              = string
            jwks_uri                            = string
            logout_endpoint                     = string
            token_endpoint                      = string
            user_info_endpoint                  = string
            authentication_request_extra_params = optional(map(string))
            scope                               = optional(string)
        })))
    source_ip_config     = optional(list(object({
            cidrs = set(string)
        })))
    workforce_vpc_config = optional(list(object({
            security_group_ids = optional(set(string))
            subnets            = optional(set(string))
            vpc_id             = optional(string)
        })))
  }))
}
