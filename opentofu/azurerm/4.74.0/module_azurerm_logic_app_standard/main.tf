resource "azurerm_logic_app_standard" "logic_app_standards" {
  for_each = var.logic_app_standards

  app_service_plan_id                      = each.value.app_service_plan_id
  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  storage_account_access_key               = each.value.storage_account_access_key
  storage_account_name                     = each.value.storage_account_name
  app_settings                             = each.value.app_settings
  bundle_version                           = each.value.bundle_version
  client_affinity_enabled                  = each.value.client_affinity_enabled
  client_certificate_mode                  = each.value.client_certificate_mode
  enabled                                  = each.value.enabled
  ftp_publish_basic_authentication_enabled = each.value.ftp_publish_basic_authentication_enabled
  https_only                               = each.value.https_only
  key_vault_reference_identity_id          = each.value.key_vault_reference_identity_id
  public_network_access                    = each.value.public_network_access
  scm_publish_basic_authentication_enabled = each.value.scm_publish_basic_authentication_enabled
  storage_account_share_name               = each.value.storage_account_share_name
  tags                                     = each.value.tags
  use_extension_bundle                     = each.value.use_extension_bundle
  version                                  = each.value.version
  virtual_network_subnet_id                = each.value.virtual_network_subnet_id
  vnet_content_share_enabled               = each.value.vnet_content_share_enabled

  dynamic "connection_string" {
    for_each = each.value.connection_string != null ? each.value.connection_string : []
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "site_config" {
    for_each = each.value.site_config != null ? each.value.site_config : []
    content {
      always_on                         = site_config.value.always_on
      app_scale_limit                   = site_config.value.app_scale_limit
      dotnet_framework_version          = site_config.value.dotnet_framework_version
      elastic_instance_minimum          = site_config.value.elastic_instance_minimum
      ftps_state                        = site_config.value.ftps_state
      health_check_path                 = site_config.value.health_check_path
      http2_enabled                     = site_config.value.http2_enabled
      ip_restriction_default_action     = site_config.value.ip_restriction_default_action
      linux_fx_version                  = site_config.value.linux_fx_version
      min_tls_version                   = site_config.value.min_tls_version
      pre_warmed_instance_count         = site_config.value.pre_warmed_instance_count
      public_network_access_enabled     = site_config.value.public_network_access_enabled
      runtime_scale_monitoring_enabled  = site_config.value.runtime_scale_monitoring_enabled
      scm_ip_restriction_default_action = site_config.value.scm_ip_restriction_default_action
      scm_min_tls_version               = site_config.value.scm_min_tls_version
      scm_type                          = site_config.value.scm_type
      scm_use_main_ip_restriction       = site_config.value.scm_use_main_ip_restriction
      use_32_bit_worker_process         = site_config.value.use_32_bit_worker_process
      vnet_route_all_enabled            = site_config.value.vnet_route_all_enabled
      websockets_enabled                = site_config.value.websockets_enabled

      dynamic "cors" {
        for_each = site_config.value.cors != null ? site_config.value.cors : []
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction != null ? site_config.value.ip_restriction : []
        content {
          action                    = ip_restriction.value.action
          description               = ip_restriction.value.description
          headers                   = ip_restriction.value.headers
          ip_address                = ip_restriction.value.ip_address
          name                      = ip_restriction.value.name
          priority                  = ip_restriction.value.priority
          service_tag               = ip_restriction.value.service_tag
          virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
        }
      }

      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction != null ? site_config.value.scm_ip_restriction : []
        content {
          action                    = scm_ip_restriction.value.action
          description               = scm_ip_restriction.value.description
          headers                   = scm_ip_restriction.value.headers
          ip_address                = scm_ip_restriction.value.ip_address
          name                      = scm_ip_restriction.value.name
          priority                  = scm_ip_restriction.value.priority
          service_tag               = scm_ip_restriction.value.service_tag
          virtual_network_subnet_id = scm_ip_restriction.value.virtual_network_subnet_id
        }
      }
    }
  }
}
