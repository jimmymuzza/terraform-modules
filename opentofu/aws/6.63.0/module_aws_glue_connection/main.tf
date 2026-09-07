resource "aws_glue_connection" "glue_connections" {
  for_each = var.glue_connections

  name                  = each.value.name
  athena_properties     = each.value.athena_properties
  catalog_id            = each.value.catalog_id
  connection_properties = each.value.connection_properties
  connection_type       = each.value.connection_type
  description           = each.value.description
  match_criteria        = each.value.match_criteria
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "authentication_configuration" {
    for_each = each.value.authentication_configuration != null ? each.value.authentication_configuration : []
    content {
      authentication_type               = authentication_configuration.value.authentication_type
      custom_authentication_credentials = authentication_configuration.value.custom_authentication_credentials
      kms_key_arn                       = authentication_configuration.value.kms_key_arn
      secret_arn                        = authentication_configuration.value.secret_arn

      dynamic "basic_authentication_credentials" {
        for_each = authentication_configuration.value.basic_authentication_credentials != null ? authentication_configuration.value.basic_authentication_credentials : []
        content {
          password = basic_authentication_credentials.value.password
          username = basic_authentication_credentials.value.username
        }
      }

      dynamic "oauth2_properties" {
        for_each = authentication_configuration.value.oauth2_properties != null ? authentication_configuration.value.oauth2_properties : []
        content {
          oauth2_grant_type        = oauth2_properties.value.oauth2_grant_type
          token_url                = oauth2_properties.value.token_url
          token_url_parameters_map = oauth2_properties.value.token_url_parameters_map

          dynamic "authorization_code_properties" {
            for_each = oauth2_properties.value.authorization_code_properties != null ? oauth2_properties.value.authorization_code_properties : []
            content {
              authorization_code = authorization_code_properties.value.authorization_code
              redirect_uri       = authorization_code_properties.value.redirect_uri
            }
          }

          dynamic "oauth2_client_application" {
            for_each = oauth2_properties.value.oauth2_client_application != null ? oauth2_properties.value.oauth2_client_application : []
            content {
              aws_managed_client_application_reference  = oauth2_client_application.value.aws_managed_client_application_reference
              user_managed_client_application_client_id = oauth2_client_application.value.user_managed_client_application_client_id
            }
          }

          dynamic "oauth2_credentials" {
            for_each = oauth2_properties.value.oauth2_credentials != null ? oauth2_properties.value.oauth2_credentials : []
            content {
              access_token                                  = oauth2_credentials.value.access_token
              jwt_token                                     = oauth2_credentials.value.jwt_token
              refresh_token                                 = oauth2_credentials.value.refresh_token
              user_managed_client_application_client_secret = oauth2_credentials.value.user_managed_client_application_client_secret
            }
          }
        }
      }
    }
  }

  dynamic "physical_connection_requirements" {
    for_each = each.value.physical_connection_requirements != null ? each.value.physical_connection_requirements : []
    content {
      availability_zone      = physical_connection_requirements.value.availability_zone
      security_group_id_list = physical_connection_requirements.value.security_group_id_list
      subnet_id              = physical_connection_requirements.value.subnet_id
    }
  }
}
