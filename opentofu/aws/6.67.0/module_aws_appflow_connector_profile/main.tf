resource "aws_appflow_connector_profile" "appflow_connector_profiles" {
  for_each = var.appflow_connector_profiles

  connection_mode = each.value.connection_mode
  connector_type  = each.value.connector_type
  name            = each.value.name
  connector_label = each.value.connector_label
  kms_arn         = each.value.kms_arn
  region          = each.value.region

  dynamic "connector_profile_config" {
    for_each = each.value.connector_profile_config != null ? each.value.connector_profile_config : []
    content {

      dynamic "connector_profile_credentials" {
        for_each = connector_profile_config.value.connector_profile_credentials != null ? connector_profile_config.value.connector_profile_credentials : []
        content {

          dynamic "amplitude" {
            for_each = connector_profile_credentials.value.amplitude != null ? connector_profile_credentials.value.amplitude : []
            content {
              api_key    = amplitude.value.api_key
              secret_key = amplitude.value.secret_key
            }
          }

          dynamic "custom_connector" {
            for_each = connector_profile_credentials.value.custom_connector != null ? connector_profile_credentials.value.custom_connector : []
            content {
              authentication_type = custom_connector.value.authentication_type

              dynamic "api_key" {
                for_each = custom_connector.value.api_key != null ? custom_connector.value.api_key : []
                content {
                  api_key        = api_key.value.api_key
                  api_secret_key = api_key.value.api_secret_key
                }
              }

              dynamic "basic" {
                for_each = custom_connector.value.basic != null ? custom_connector.value.basic : []
                content {
                  password = basic.value.password
                  username = basic.value.username
                }
              }

              dynamic "custom" {
                for_each = custom_connector.value.custom != null ? custom_connector.value.custom : []
                content {
                  custom_authentication_type = custom.value.custom_authentication_type
                  credentials_map            = custom.value.credentials_map
                }
              }

              dynamic "oauth2" {
                for_each = custom_connector.value.oauth2 != null ? custom_connector.value.oauth2 : []
                content {
                  access_token  = oauth2.value.access_token
                  client_id     = oauth2.value.client_id
                  client_secret = oauth2.value.client_secret
                  refresh_token = oauth2.value.refresh_token

                  dynamic "oauth_request" {
                    for_each = oauth2.value.oauth_request != null ? oauth2.value.oauth_request : []
                    content {
                      auth_code    = oauth_request.value.auth_code
                      redirect_uri = oauth_request.value.redirect_uri
                    }
                  }
                }
              }
            }
          }

          dynamic "datadog" {
            for_each = connector_profile_credentials.value.datadog != null ? connector_profile_credentials.value.datadog : []
            content {
              api_key         = datadog.value.api_key
              application_key = datadog.value.application_key
            }
          }

          dynamic "dynatrace" {
            for_each = connector_profile_credentials.value.dynatrace != null ? connector_profile_credentials.value.dynatrace : []
            content {
              api_token = dynatrace.value.api_token
            }
          }

          dynamic "google_analytics" {
            for_each = connector_profile_credentials.value.google_analytics != null ? connector_profile_credentials.value.google_analytics : []
            content {
              client_id     = google_analytics.value.client_id
              client_secret = google_analytics.value.client_secret
              access_token  = google_analytics.value.access_token
              refresh_token = google_analytics.value.refresh_token

              dynamic "oauth_request" {
                for_each = google_analytics.value.oauth_request != null ? google_analytics.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }

          dynamic "honeycode" {
            for_each = connector_profile_credentials.value.honeycode != null ? connector_profile_credentials.value.honeycode : []
            content {
              access_token  = honeycode.value.access_token
              refresh_token = honeycode.value.refresh_token

              dynamic "oauth_request" {
                for_each = honeycode.value.oauth_request != null ? honeycode.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }

          dynamic "infor_nexus" {
            for_each = connector_profile_credentials.value.infor_nexus != null ? connector_profile_credentials.value.infor_nexus : []
            content {
              access_key_id     = infor_nexus.value.access_key_id
              datakey           = infor_nexus.value.datakey
              secret_access_key = infor_nexus.value.secret_access_key
              user_id           = infor_nexus.value.user_id
            }
          }

          dynamic "marketo" {
            for_each = connector_profile_credentials.value.marketo != null ? connector_profile_credentials.value.marketo : []
            content {
              client_id     = marketo.value.client_id
              client_secret = marketo.value.client_secret
              access_token  = marketo.value.access_token

              dynamic "oauth_request" {
                for_each = marketo.value.oauth_request != null ? marketo.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }

          dynamic "redshift" {
            for_each = connector_profile_credentials.value.redshift != null ? connector_profile_credentials.value.redshift : []
            content {
              password = redshift.value.password
              username = redshift.value.username
            }
          }

          dynamic "salesforce" {
            for_each = connector_profile_credentials.value.salesforce != null ? connector_profile_credentials.value.salesforce : []
            content {
              access_token           = salesforce.value.access_token
              client_credentials_arn = salesforce.value.client_credentials_arn
              jwt_token              = salesforce.value.jwt_token
              oauth2_grant_type      = salesforce.value.oauth2_grant_type
              refresh_token          = salesforce.value.refresh_token

              dynamic "oauth_request" {
                for_each = salesforce.value.oauth_request != null ? salesforce.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }

          dynamic "sapo_data" {
            for_each = connector_profile_credentials.value.sapo_data != null ? connector_profile_credentials.value.sapo_data : []
            content {

              dynamic "basic_auth_credentials" {
                for_each = sapo_data.value.basic_auth_credentials != null ? sapo_data.value.basic_auth_credentials : []
                content {
                  password = basic_auth_credentials.value.password
                  username = basic_auth_credentials.value.username
                }
              }

              dynamic "oauth_credentials" {
                for_each = sapo_data.value.oauth_credentials != null ? sapo_data.value.oauth_credentials : []
                content {
                  client_id     = oauth_credentials.value.client_id
                  client_secret = oauth_credentials.value.client_secret
                  access_token  = oauth_credentials.value.access_token
                  refresh_token = oauth_credentials.value.refresh_token

                  dynamic "oauth_request" {
                    for_each = oauth_credentials.value.oauth_request != null ? oauth_credentials.value.oauth_request : []
                    content {
                      auth_code    = oauth_request.value.auth_code
                      redirect_uri = oauth_request.value.redirect_uri
                    }
                  }
                }
              }
            }
          }

          dynamic "service_now" {
            for_each = connector_profile_credentials.value.service_now != null ? connector_profile_credentials.value.service_now : []
            content {
              password = service_now.value.password
              username = service_now.value.username
            }
          }

          dynamic "singular" {
            for_each = connector_profile_credentials.value.singular != null ? connector_profile_credentials.value.singular : []
            content {
              api_key = singular.value.api_key
            }
          }

          dynamic "slack" {
            for_each = connector_profile_credentials.value.slack != null ? connector_profile_credentials.value.slack : []
            content {
              client_id     = slack.value.client_id
              client_secret = slack.value.client_secret
              access_token  = slack.value.access_token

              dynamic "oauth_request" {
                for_each = slack.value.oauth_request != null ? slack.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }

          dynamic "snowflake" {
            for_each = connector_profile_credentials.value.snowflake != null ? connector_profile_credentials.value.snowflake : []
            content {
              password = snowflake.value.password
              username = snowflake.value.username
            }
          }

          dynamic "trendmicro" {
            for_each = connector_profile_credentials.value.trendmicro != null ? connector_profile_credentials.value.trendmicro : []
            content {
              api_secret_key = trendmicro.value.api_secret_key
            }
          }

          dynamic "veeva" {
            for_each = connector_profile_credentials.value.veeva != null ? connector_profile_credentials.value.veeva : []
            content {
              password = veeva.value.password
              username = veeva.value.username
            }
          }

          dynamic "zendesk" {
            for_each = connector_profile_credentials.value.zendesk != null ? connector_profile_credentials.value.zendesk : []
            content {
              client_id     = zendesk.value.client_id
              client_secret = zendesk.value.client_secret
              access_token  = zendesk.value.access_token

              dynamic "oauth_request" {
                for_each = zendesk.value.oauth_request != null ? zendesk.value.oauth_request : []
                content {
                  auth_code    = oauth_request.value.auth_code
                  redirect_uri = oauth_request.value.redirect_uri
                }
              }
            }
          }
        }
      }

      dynamic "connector_profile_properties" {
        for_each = connector_profile_config.value.connector_profile_properties != null ? connector_profile_config.value.connector_profile_properties : []
        content {

          dynamic "amplitude" {
            for_each = connector_profile_properties.value.amplitude != null ? connector_profile_properties.value.amplitude : []
            content {
            }
          }

          dynamic "custom_connector" {
            for_each = connector_profile_properties.value.custom_connector != null ? connector_profile_properties.value.custom_connector : []
            content {
              profile_properties = custom_connector.value.profile_properties

              dynamic "oauth2_properties" {
                for_each = custom_connector.value.oauth2_properties != null ? custom_connector.value.oauth2_properties : []
                content {
                  oauth2_grant_type           = oauth2_properties.value.oauth2_grant_type
                  token_url                   = oauth2_properties.value.token_url
                  token_url_custom_properties = oauth2_properties.value.token_url_custom_properties
                }
              }
            }
          }

          dynamic "datadog" {
            for_each = connector_profile_properties.value.datadog != null ? connector_profile_properties.value.datadog : []
            content {
              instance_url = datadog.value.instance_url
            }
          }

          dynamic "dynatrace" {
            for_each = connector_profile_properties.value.dynatrace != null ? connector_profile_properties.value.dynatrace : []
            content {
              instance_url = dynatrace.value.instance_url
            }
          }

          dynamic "google_analytics" {
            for_each = connector_profile_properties.value.google_analytics != null ? connector_profile_properties.value.google_analytics : []
            content {
            }
          }

          dynamic "honeycode" {
            for_each = connector_profile_properties.value.honeycode != null ? connector_profile_properties.value.honeycode : []
            content {
            }
          }

          dynamic "infor_nexus" {
            for_each = connector_profile_properties.value.infor_nexus != null ? connector_profile_properties.value.infor_nexus : []
            content {
              instance_url = infor_nexus.value.instance_url
            }
          }

          dynamic "marketo" {
            for_each = connector_profile_properties.value.marketo != null ? connector_profile_properties.value.marketo : []
            content {
              instance_url = marketo.value.instance_url
            }
          }

          dynamic "redshift" {
            for_each = connector_profile_properties.value.redshift != null ? connector_profile_properties.value.redshift : []
            content {
              bucket_name        = redshift.value.bucket_name
              role_arn           = redshift.value.role_arn
              bucket_prefix      = redshift.value.bucket_prefix
              cluster_identifier = redshift.value.cluster_identifier
              data_api_role_arn  = redshift.value.data_api_role_arn
              database_name      = redshift.value.database_name
              database_url       = redshift.value.database_url
            }
          }

          dynamic "salesforce" {
            for_each = connector_profile_properties.value.salesforce != null ? connector_profile_properties.value.salesforce : []
            content {
              instance_url                                   = salesforce.value.instance_url
              is_sandbox_environment                         = salesforce.value.is_sandbox_environment
              use_privatelink_for_metadata_and_authorization = salesforce.value.use_privatelink_for_metadata_and_authorization
            }
          }

          dynamic "sapo_data" {
            for_each = connector_profile_properties.value.sapo_data != null ? connector_profile_properties.value.sapo_data : []
            content {
              application_host_url      = sapo_data.value.application_host_url
              application_service_path  = sapo_data.value.application_service_path
              client_number             = sapo_data.value.client_number
              port_number               = sapo_data.value.port_number
              logon_language            = sapo_data.value.logon_language
              private_link_service_name = sapo_data.value.private_link_service_name

              dynamic "oauth_properties" {
                for_each = sapo_data.value.oauth_properties != null ? sapo_data.value.oauth_properties : []
                content {
                  auth_code_url = oauth_properties.value.auth_code_url
                  oauth_scopes  = oauth_properties.value.oauth_scopes
                  token_url     = oauth_properties.value.token_url
                }
              }
            }
          }

          dynamic "service_now" {
            for_each = connector_profile_properties.value.service_now != null ? connector_profile_properties.value.service_now : []
            content {
              instance_url = service_now.value.instance_url
            }
          }

          dynamic "singular" {
            for_each = connector_profile_properties.value.singular != null ? connector_profile_properties.value.singular : []
            content {
            }
          }

          dynamic "slack" {
            for_each = connector_profile_properties.value.slack != null ? connector_profile_properties.value.slack : []
            content {
              instance_url = slack.value.instance_url
            }
          }

          dynamic "snowflake" {
            for_each = connector_profile_properties.value.snowflake != null ? connector_profile_properties.value.snowflake : []
            content {
              bucket_name               = snowflake.value.bucket_name
              stage                     = snowflake.value.stage
              warehouse                 = snowflake.value.warehouse
              account_name              = snowflake.value.account_name
              bucket_prefix             = snowflake.value.bucket_prefix
              private_link_service_name = snowflake.value.private_link_service_name
              region                    = snowflake.value.region
            }
          }

          dynamic "trendmicro" {
            for_each = connector_profile_properties.value.trendmicro != null ? connector_profile_properties.value.trendmicro : []
            content {
            }
          }

          dynamic "veeva" {
            for_each = connector_profile_properties.value.veeva != null ? connector_profile_properties.value.veeva : []
            content {
              instance_url = veeva.value.instance_url
            }
          }

          dynamic "zendesk" {
            for_each = connector_profile_properties.value.zendesk != null ? connector_profile_properties.value.zendesk : []
            content {
              instance_url = zendesk.value.instance_url
            }
          }
        }
      }
    }
  }
}
