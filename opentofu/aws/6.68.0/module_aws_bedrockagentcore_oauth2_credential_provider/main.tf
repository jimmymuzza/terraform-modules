resource "aws_bedrockagentcore_oauth2_credential_provider" "bedrockagentcore_oauth2_credential_providers" {
  for_each = var.bedrockagentcore_oauth2_credential_providers

  credential_provider_vendor = each.value.credential_provider_vendor
  name                       = each.value.name
  region                     = each.value.region
  tags                       = each.value.tags

  dynamic "oauth2_provider_config" {
    for_each = each.value.oauth2_provider_config != null ? each.value.oauth2_provider_config : []
    content {

      dynamic "atlassian_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.atlassian_oauth2_provider_config != null ? oauth2_provider_config.value.atlassian_oauth2_provider_config : []
        content {
          client_credentials_wo_version = atlassian_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = atlassian_oauth2_provider_config.value.client_id
          client_id_wo                  = atlassian_oauth2_provider_config.value.client_id_wo
          client_secret                 = atlassian_oauth2_provider_config.value.client_secret
          client_secret_source          = atlassian_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = atlassian_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = atlassian_oauth2_provider_config.value.client_secret_config != null ? atlassian_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "custom_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.custom_oauth2_provider_config != null ? oauth2_provider_config.value.custom_oauth2_provider_config : []
        content {
          client_authentication_method  = custom_oauth2_provider_config.value.client_authentication_method
          client_credentials_wo_version = custom_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = custom_oauth2_provider_config.value.client_id
          client_id_wo                  = custom_oauth2_provider_config.value.client_id_wo
          client_secret                 = custom_oauth2_provider_config.value.client_secret
          client_secret_source          = custom_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = custom_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = custom_oauth2_provider_config.value.client_secret_config != null ? custom_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }

          dynamic "oauth_discovery" {
            for_each = custom_oauth2_provider_config.value.oauth_discovery != null ? custom_oauth2_provider_config.value.oauth_discovery : []
            content {
              discovery_url = oauth_discovery.value.discovery_url

              dynamic "authorization_server_metadata" {
                for_each = oauth_discovery.value.authorization_server_metadata != null ? oauth_discovery.value.authorization_server_metadata : []
                content {
                  authorization_endpoint      = authorization_server_metadata.value.authorization_endpoint
                  issuer                      = authorization_server_metadata.value.issuer
                  token_endpoint              = authorization_server_metadata.value.token_endpoint
                  response_types              = authorization_server_metadata.value.response_types
                  token_endpoint_auth_methods = authorization_server_metadata.value.token_endpoint_auth_methods
                }
              }
            }
          }

          dynamic "on_behalf_of_token_exchange_config" {
            for_each = custom_oauth2_provider_config.value.on_behalf_of_token_exchange_config != null ? custom_oauth2_provider_config.value.on_behalf_of_token_exchange_config : []
            content {
              grant_type = on_behalf_of_token_exchange_config.value.grant_type

              dynamic "token_exchange_grant_type_config" {
                for_each = on_behalf_of_token_exchange_config.value.token_exchange_grant_type_config != null ? on_behalf_of_token_exchange_config.value.token_exchange_grant_type_config : []
                content {
                  actor_token_content = token_exchange_grant_type_config.value.actor_token_content
                  actor_token_scopes  = token_exchange_grant_type_config.value.actor_token_scopes
                }
              }
            }
          }

          dynamic "private_endpoint" {
            for_each = custom_oauth2_provider_config.value.private_endpoint != null ? custom_oauth2_provider_config.value.private_endpoint : []
            content {

              dynamic "managed_vpc_resource" {
                for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                content {
                  endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                  subnet_ids               = managed_vpc_resource.value.subnet_ids
                  vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                  routing_domain           = managed_vpc_resource.value.routing_domain
                  security_group_ids       = managed_vpc_resource.value.security_group_ids
                  tags                     = managed_vpc_resource.value.tags
                }
              }

              dynamic "self_managed_lattice_resource" {
                for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                content {
                  resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                }
              }
            }
          }

          dynamic "private_endpoint_override" {
            for_each = custom_oauth2_provider_config.value.private_endpoint_override != null ? custom_oauth2_provider_config.value.private_endpoint_override : []
            content {
              domain = private_endpoint_override.value.domain

              dynamic "private_endpoint" {
                for_each = private_endpoint_override.value.private_endpoint != null ? private_endpoint_override.value.private_endpoint : []
                content {

                  dynamic "managed_vpc_resource" {
                    for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                    content {
                      endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                      subnet_ids               = managed_vpc_resource.value.subnet_ids
                      vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                      routing_domain           = managed_vpc_resource.value.routing_domain
                      security_group_ids       = managed_vpc_resource.value.security_group_ids
                      tags                     = managed_vpc_resource.value.tags
                    }
                  }

                  dynamic "self_managed_lattice_resource" {
                    for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                    content {
                      resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                    }
                  }
                }
              }
            }
          }

          dynamic "private_key_jwt_config" {
            for_each = custom_oauth2_provider_config.value.private_key_jwt_config != null ? custom_oauth2_provider_config.value.private_key_jwt_config : []
            content {
              additional_header_claims  = private_key_jwt_config.value.additional_header_claims
              additional_payload_claims = private_key_jwt_config.value.additional_payload_claims
              signing_algorithm         = private_key_jwt_config.value.signing_algorithm

              dynamic "private_key_source" {
                for_each = private_key_jwt_config.value.private_key_source != null ? private_key_jwt_config.value.private_key_source : []
                content {

                  dynamic "kms_key_source" {
                    for_each = private_key_source.value.kms_key_source != null ? private_key_source.value.kms_key_source : []
                    content {
                      kms_key_arn = kms_key_source.value.kms_key_arn
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "github_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.github_oauth2_provider_config != null ? oauth2_provider_config.value.github_oauth2_provider_config : []
        content {
          client_credentials_wo_version = github_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = github_oauth2_provider_config.value.client_id
          client_id_wo                  = github_oauth2_provider_config.value.client_id_wo
          client_secret                 = github_oauth2_provider_config.value.client_secret
          client_secret_source          = github_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = github_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = github_oauth2_provider_config.value.client_secret_config != null ? github_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "google_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.google_oauth2_provider_config != null ? oauth2_provider_config.value.google_oauth2_provider_config : []
        content {
          client_credentials_wo_version = google_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = google_oauth2_provider_config.value.client_id
          client_id_wo                  = google_oauth2_provider_config.value.client_id_wo
          client_secret                 = google_oauth2_provider_config.value.client_secret
          client_secret_source          = google_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = google_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = google_oauth2_provider_config.value.client_secret_config != null ? google_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "included_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.included_oauth2_provider_config != null ? oauth2_provider_config.value.included_oauth2_provider_config : []
        content {
          authorization_endpoint        = included_oauth2_provider_config.value.authorization_endpoint
          client_credentials_wo_version = included_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = included_oauth2_provider_config.value.client_id
          client_id_wo                  = included_oauth2_provider_config.value.client_id_wo
          client_secret                 = included_oauth2_provider_config.value.client_secret
          client_secret_source          = included_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = included_oauth2_provider_config.value.client_secret_wo
          issuer                        = included_oauth2_provider_config.value.issuer
          token_endpoint                = included_oauth2_provider_config.value.token_endpoint

          dynamic "client_secret_config" {
            for_each = included_oauth2_provider_config.value.client_secret_config != null ? included_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "linkedin_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.linkedin_oauth2_provider_config != null ? oauth2_provider_config.value.linkedin_oauth2_provider_config : []
        content {
          client_credentials_wo_version = linkedin_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = linkedin_oauth2_provider_config.value.client_id
          client_id_wo                  = linkedin_oauth2_provider_config.value.client_id_wo
          client_secret                 = linkedin_oauth2_provider_config.value.client_secret
          client_secret_source          = linkedin_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = linkedin_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = linkedin_oauth2_provider_config.value.client_secret_config != null ? linkedin_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "microsoft_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.microsoft_oauth2_provider_config != null ? oauth2_provider_config.value.microsoft_oauth2_provider_config : []
        content {
          client_credentials_wo_version = microsoft_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = microsoft_oauth2_provider_config.value.client_id
          client_id_wo                  = microsoft_oauth2_provider_config.value.client_id_wo
          client_secret                 = microsoft_oauth2_provider_config.value.client_secret
          client_secret_source          = microsoft_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = microsoft_oauth2_provider_config.value.client_secret_wo
          tenant_id                     = microsoft_oauth2_provider_config.value.tenant_id
          tenant_id_wo                  = microsoft_oauth2_provider_config.value.tenant_id_wo
          tenant_id_wo_version          = microsoft_oauth2_provider_config.value.tenant_id_wo_version

          dynamic "client_secret_config" {
            for_each = microsoft_oauth2_provider_config.value.client_secret_config != null ? microsoft_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "salesforce_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.salesforce_oauth2_provider_config != null ? oauth2_provider_config.value.salesforce_oauth2_provider_config : []
        content {
          client_credentials_wo_version = salesforce_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = salesforce_oauth2_provider_config.value.client_id
          client_id_wo                  = salesforce_oauth2_provider_config.value.client_id_wo
          client_secret                 = salesforce_oauth2_provider_config.value.client_secret
          client_secret_source          = salesforce_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = salesforce_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = salesforce_oauth2_provider_config.value.client_secret_config != null ? salesforce_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }

      dynamic "slack_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.slack_oauth2_provider_config != null ? oauth2_provider_config.value.slack_oauth2_provider_config : []
        content {
          client_credentials_wo_version = slack_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = slack_oauth2_provider_config.value.client_id
          client_id_wo                  = slack_oauth2_provider_config.value.client_id_wo
          client_secret                 = slack_oauth2_provider_config.value.client_secret
          client_secret_source          = slack_oauth2_provider_config.value.client_secret_source
          client_secret_wo              = slack_oauth2_provider_config.value.client_secret_wo

          dynamic "client_secret_config" {
            for_each = slack_oauth2_provider_config.value.client_secret_config != null ? slack_oauth2_provider_config.value.client_secret_config : []
            content {
              json_key  = client_secret_config.value.json_key
              secret_id = client_secret_config.value.secret_id
            }
          }
        }
      }
    }
  }
}
