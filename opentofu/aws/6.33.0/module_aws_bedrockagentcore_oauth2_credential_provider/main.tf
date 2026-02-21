resource "aws_bedrockagentcore_oauth2_credential_provider" "bedrockagentcore_oauth2_credential_providers" {
  for_each = var.bedrockagentcore_oauth2_credential_providers

  credential_provider_vendor = each.value.credential_provider_vendor
  name                       = each.value.name
  region                     = each.value.region

  dynamic "oauth2_provider_config" {
    for_each = each.value.oauth2_provider_config != null ? each.value.oauth2_provider_config : []
    content {

      dynamic "custom_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.custom_oauth2_provider_config != null ? oauth2_provider_config.value.custom_oauth2_provider_config : []
        content {
          client_credentials_wo_version = custom_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = custom_oauth2_provider_config.value.client_id
          client_id_wo                  = custom_oauth2_provider_config.value.client_id_wo
          client_secret                 = custom_oauth2_provider_config.value.client_secret
          client_secret_wo              = custom_oauth2_provider_config.value.client_secret_wo

          dynamic "oauth_discovery" {
            for_each = custom_oauth2_provider_config.value.oauth_discovery != null ? custom_oauth2_provider_config.value.oauth_discovery : []
            content {
              discovery_url = oauth_discovery.value.discovery_url

              dynamic "authorization_server_metadata" {
                for_each = oauth_discovery.value.authorization_server_metadata != null ? oauth_discovery.value.authorization_server_metadata : []
                content {
                  authorization_endpoint = authorization_server_metadata.value.authorization_endpoint
                  issuer                 = authorization_server_metadata.value.issuer
                  token_endpoint         = authorization_server_metadata.value.token_endpoint
                  response_types         = authorization_server_metadata.value.response_types
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
          client_secret_wo              = github_oauth2_provider_config.value.client_secret_wo
        }
      }

      dynamic "google_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.google_oauth2_provider_config != null ? oauth2_provider_config.value.google_oauth2_provider_config : []
        content {
          client_credentials_wo_version = google_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = google_oauth2_provider_config.value.client_id
          client_id_wo                  = google_oauth2_provider_config.value.client_id_wo
          client_secret                 = google_oauth2_provider_config.value.client_secret
          client_secret_wo              = google_oauth2_provider_config.value.client_secret_wo
        }
      }

      dynamic "microsoft_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.microsoft_oauth2_provider_config != null ? oauth2_provider_config.value.microsoft_oauth2_provider_config : []
        content {
          client_credentials_wo_version = microsoft_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = microsoft_oauth2_provider_config.value.client_id
          client_id_wo                  = microsoft_oauth2_provider_config.value.client_id_wo
          client_secret                 = microsoft_oauth2_provider_config.value.client_secret
          client_secret_wo              = microsoft_oauth2_provider_config.value.client_secret_wo
        }
      }

      dynamic "salesforce_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.salesforce_oauth2_provider_config != null ? oauth2_provider_config.value.salesforce_oauth2_provider_config : []
        content {
          client_credentials_wo_version = salesforce_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = salesforce_oauth2_provider_config.value.client_id
          client_id_wo                  = salesforce_oauth2_provider_config.value.client_id_wo
          client_secret                 = salesforce_oauth2_provider_config.value.client_secret
          client_secret_wo              = salesforce_oauth2_provider_config.value.client_secret_wo
        }
      }

      dynamic "slack_oauth2_provider_config" {
        for_each = oauth2_provider_config.value.slack_oauth2_provider_config != null ? oauth2_provider_config.value.slack_oauth2_provider_config : []
        content {
          client_credentials_wo_version = slack_oauth2_provider_config.value.client_credentials_wo_version
          client_id                     = slack_oauth2_provider_config.value.client_id
          client_id_wo                  = slack_oauth2_provider_config.value.client_id_wo
          client_secret                 = slack_oauth2_provider_config.value.client_secret
          client_secret_wo              = slack_oauth2_provider_config.value.client_secret_wo
        }
      }
    }
  }
}
