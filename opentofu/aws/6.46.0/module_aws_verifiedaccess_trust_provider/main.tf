resource "aws_verifiedaccess_trust_provider" "verifiedaccess_trust_providers" {
  for_each = var.verifiedaccess_trust_providers

  policy_reference_name      = each.value.policy_reference_name
  trust_provider_type        = each.value.trust_provider_type
  description                = each.value.description
  device_trust_provider_type = each.value.device_trust_provider_type
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  user_trust_provider_type   = each.value.user_trust_provider_type

  dynamic "device_options" {
    for_each = each.value.device_options != null ? each.value.device_options : []
    content {
      tenant_id = device_options.value.tenant_id
    }
  }

  dynamic "native_application_oidc_options" {
    for_each = each.value.native_application_oidc_options != null ? each.value.native_application_oidc_options : []
    content {
      client_secret               = native_application_oidc_options.value.client_secret
      authorization_endpoint      = native_application_oidc_options.value.authorization_endpoint
      client_id                   = native_application_oidc_options.value.client_id
      issuer                      = native_application_oidc_options.value.issuer
      public_signing_key_endpoint = native_application_oidc_options.value.public_signing_key_endpoint
      scope                       = native_application_oidc_options.value.scope
      token_endpoint              = native_application_oidc_options.value.token_endpoint
      user_info_endpoint          = native_application_oidc_options.value.user_info_endpoint
    }
  }

  dynamic "oidc_options" {
    for_each = each.value.oidc_options != null ? each.value.oidc_options : []
    content {
      client_secret          = oidc_options.value.client_secret
      authorization_endpoint = oidc_options.value.authorization_endpoint
      client_id              = oidc_options.value.client_id
      issuer                 = oidc_options.value.issuer
      scope                  = oidc_options.value.scope
      token_endpoint         = oidc_options.value.token_endpoint
      user_info_endpoint     = oidc_options.value.user_info_endpoint
    }
  }

  dynamic "sse_specification" {
    for_each = each.value.sse_specification != null ? each.value.sse_specification : []
    content {
      customer_managed_key_enabled = sse_specification.value.customer_managed_key_enabled
      kms_key_arn                  = sse_specification.value.kms_key_arn
    }
  }
}
