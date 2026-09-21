variable "glue_connections" {
  description = <<EOT
Map of glue_connections, attributes below
Required:
    - name
Optional:
    - athena_properties
    - catalog_id
    - connection_properties
    - connection_type
    - description
    - match_criteria
    - region
    - tags
    - tags_all
    - authentication_configuration
    - physical_connection_requirements
EOT

  type = map(object({
    name                             = string
    athena_properties                = optional(map(string))
    catalog_id                       = optional(string)
    connection_properties            = optional(map(string))
    connection_type                  = optional(string)
    description                      = optional(string)
    match_criteria                   = optional(list(string))
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    authentication_configuration     = optional(list(object({
            authentication_type               = string
            custom_authentication_credentials = optional(map(string))
            kms_key_arn                       = optional(string)
            secret_arn                        = optional(string)
            basic_authentication_credentials  = optional(list(object({
                password = string
                username = string
            })))
            oauth2_properties                 = optional(list(object({
                oauth2_grant_type             = optional(string)
                token_url                     = optional(string)
                token_url_parameters_map      = optional(map(string))
                authorization_code_properties = optional(list(object({
                    authorization_code = string
                    redirect_uri       = string
                })))
                oauth2_client_application     = optional(list(object({
                    aws_managed_client_application_reference  = optional(string)
                    user_managed_client_application_client_id = optional(string)
                })))
                oauth2_credentials            = optional(list(object({
                    access_token                                  = optional(string)
                    jwt_token                                     = optional(string)
                    refresh_token                                 = optional(string)
                    user_managed_client_application_client_secret = optional(string)
                })))
            })))
        })))
    physical_connection_requirements = optional(list(object({
            availability_zone      = optional(string)
            security_group_id_list = optional(set(string))
            subnet_id              = optional(string)
        })))
  }))
}
