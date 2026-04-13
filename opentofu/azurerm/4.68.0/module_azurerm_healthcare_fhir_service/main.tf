resource "azurerm_healthcare_fhir_service" "healthcare_fhir_services" {
  for_each = var.healthcare_fhir_services

  location                                  = each.value.location
  name                                      = each.value.name
  resource_group_name                       = each.value.resource_group_name
  workspace_id                              = each.value.workspace_id
  access_policy_object_ids                  = each.value.access_policy_object_ids
  configuration_export_storage_account_name = each.value.configuration_export_storage_account_name
  container_registry_login_server_url       = each.value.container_registry_login_server_url
  kind                                      = each.value.kind
  tags                                      = each.value.tags

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {
      audience            = authentication.value.audience
      authority           = authentication.value.authority
      smart_proxy_enabled = authentication.value.smart_proxy_enabled
    }
  }

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allowed_headers     = cors.value.allowed_headers
      allowed_methods     = cors.value.allowed_methods
      allowed_origins     = cors.value.allowed_origins
      credentials_allowed = cors.value.credentials_allowed
      max_age_in_seconds  = cors.value.max_age_in_seconds
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "oci_artifact" {
    for_each = each.value.oci_artifact != null ? each.value.oci_artifact : []
    content {
      login_server = oci_artifact.value.login_server
      digest       = oci_artifact.value.digest
      image_name   = oci_artifact.value.image_name
    }
  }
}
