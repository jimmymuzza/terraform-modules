resource "azurerm_spring_cloud_gateway" "spring_cloud_gateways" {
  for_each = var.spring_cloud_gateways

  name                                     = each.value.name
  spring_cloud_service_id                  = each.value.spring_cloud_service_id
  application_performance_monitoring_ids   = each.value.application_performance_monitoring_ids
  application_performance_monitoring_types = each.value.application_performance_monitoring_types
  environment_variables                    = each.value.environment_variables
  https_only                               = each.value.https_only
  instance_count                           = each.value.instance_count
  public_network_access_enabled            = each.value.public_network_access_enabled
  sensitive_environment_variables          = each.value.sensitive_environment_variables

  dynamic "api_metadata" {
    for_each = each.value.api_metadata != null ? each.value.api_metadata : []
    content {
      description       = api_metadata.value.description
      documentation_url = api_metadata.value.documentation_url
      server_url        = api_metadata.value.server_url
      title             = api_metadata.value.title
      version           = api_metadata.value.version
    }
  }

  dynamic "client_authorization" {
    for_each = each.value.client_authorization != null ? each.value.client_authorization : []
    content {
      certificate_ids      = client_authorization.value.certificate_ids
      verification_enabled = client_authorization.value.verification_enabled
    }
  }

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allowed_headers         = cors.value.allowed_headers
      allowed_methods         = cors.value.allowed_methods
      allowed_origin_patterns = cors.value.allowed_origin_patterns
      allowed_origins         = cors.value.allowed_origins
      credentials_allowed     = cors.value.credentials_allowed
      exposed_headers         = cors.value.exposed_headers
      max_age_seconds         = cors.value.max_age_seconds
    }
  }

  dynamic "local_response_cache_per_instance" {
    for_each = each.value.local_response_cache_per_instance != null ? each.value.local_response_cache_per_instance : []
    content {
      size         = local_response_cache_per_instance.value.size
      time_to_live = local_response_cache_per_instance.value.time_to_live
    }
  }

  dynamic "local_response_cache_per_route" {
    for_each = each.value.local_response_cache_per_route != null ? each.value.local_response_cache_per_route : []
    content {
      size         = local_response_cache_per_route.value.size
      time_to_live = local_response_cache_per_route.value.time_to_live
    }
  }

  dynamic "quota" {
    for_each = each.value.quota != null ? each.value.quota : []
    content {
      cpu    = quota.value.cpu
      memory = quota.value.memory
    }
  }

  dynamic "sso" {
    for_each = each.value.sso != null ? each.value.sso : []
    content {
      client_id     = sso.value.client_id
      client_secret = sso.value.client_secret
      issuer_uri    = sso.value.issuer_uri
      scope         = sso.value.scope
    }
  }
}
