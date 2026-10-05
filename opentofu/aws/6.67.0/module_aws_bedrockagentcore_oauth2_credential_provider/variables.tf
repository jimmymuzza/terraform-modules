variable "bedrockagentcore_oauth2_credential_providers" {
  description = <<EOT
Map of bedrockagentcore_oauth2_credential_providers, attributes below
Required:
    - credential_provider_vendor
    - name
Optional:
    - region
    - tags
    - oauth2_provider_config
EOT

  type = map(object({
    credential_provider_vendor = string
    name                       = string
    region                     = optional(string)
    tags                       = optional(map(string))
    oauth2_provider_config     = optional(list(object({
            atlassian_oauth2_provider_config  = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            custom_oauth2_provider_config     = optional(list(object({
                client_authentication_method       = optional(string)
                client_credentials_wo_version      = optional(number)
                client_id                          = optional(string)
                client_id_wo                       = optional(string)
                client_secret                      = optional(string)
                client_secret_source               = optional(string)
                client_secret_wo                   = optional(string)
                client_secret_config               = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
                oauth_discovery                    = optional(list(object({
                    discovery_url                 = optional(string)
                    authorization_server_metadata = optional(list(object({
                        authorization_endpoint      = string
                        issuer                      = string
                        token_endpoint              = string
                        response_types              = optional(set(string))
                        token_endpoint_auth_methods = optional(list(string))
                    })))
                })))
                on_behalf_of_token_exchange_config = optional(list(object({
                    grant_type                       = string
                    token_exchange_grant_type_config = optional(list(object({
                        actor_token_content = string
                        actor_token_scopes  = optional(set(string))
                    })))
                })))
                private_endpoint                   = optional(list(object({
                    managed_vpc_resource          = optional(list(object({
                        endpoint_ip_address_type = string
                        subnet_ids               = set(string)
                        vpc_identifier           = string
                        routing_domain           = optional(string)
                        security_group_ids       = optional(set(string))
                        tags                     = optional(map(string))
                    })))
                    self_managed_lattice_resource = optional(list(object({
                        resource_configuration_identifier = optional(string)
                    })))
                })))
                private_endpoint_override          = optional(list(object({
                    domain           = string
                    private_endpoint = optional(list(object({
                        managed_vpc_resource          = optional(list(object({
                            endpoint_ip_address_type = string
                            subnet_ids               = set(string)
                            vpc_identifier           = string
                            routing_domain           = optional(string)
                            security_group_ids       = optional(set(string))
                            tags                     = optional(map(string))
                        })))
                        self_managed_lattice_resource = optional(list(object({
                            resource_configuration_identifier = optional(string)
                        })))
                    })))
                })))
                private_key_jwt_config             = optional(list(object({
                    additional_header_claims  = optional(map(string))
                    additional_payload_claims = optional(map(string))
                    signing_algorithm         = optional(string)
                    private_key_source        = optional(list(object({
                        kms_key_source = optional(list(object({
                            kms_key_arn = string
                        })))
                    })))
                })))
            })))
            github_oauth2_provider_config     = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            google_oauth2_provider_config     = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            included_oauth2_provider_config   = optional(list(object({
                authorization_endpoint        = optional(string)
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                issuer                        = optional(string)
                token_endpoint                = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            linkedin_oauth2_provider_config   = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            microsoft_oauth2_provider_config  = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                tenant_id                     = optional(string)
                tenant_id_wo                  = optional(string)
                tenant_id_wo_version          = optional(number)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            salesforce_oauth2_provider_config = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
            slack_oauth2_provider_config      = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_source          = optional(string)
                client_secret_wo              = optional(string)
                client_secret_config          = optional(list(object({
                    json_key  = string
                    secret_id = string
                })))
            })))
        })))
  }))
}
