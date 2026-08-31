resource "aws_workspaces_directory" "workspaces_directories" {
  for_each = var.workspaces_directories

  directory_id                    = each.value.directory_id
  ip_group_ids                    = each.value.ip_group_ids
  region                          = each.value.region
  subnet_ids                      = each.value.subnet_ids
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  tenancy                         = each.value.tenancy
  user_identity_type              = each.value.user_identity_type
  workspace_directory_description = each.value.workspace_directory_description
  workspace_directory_name        = each.value.workspace_directory_name
  workspace_type                  = each.value.workspace_type

  dynamic "active_directory_config" {
    for_each = each.value.active_directory_config != null ? each.value.active_directory_config : []
    content {
      domain_name                = active_directory_config.value.domain_name
      service_account_secret_arn = active_directory_config.value.service_account_secret_arn
    }
  }

  dynamic "certificate_based_auth_properties" {
    for_each = each.value.certificate_based_auth_properties != null ? each.value.certificate_based_auth_properties : []
    content {
      certificate_authority_arn = certificate_based_auth_properties.value.certificate_authority_arn
      status                    = certificate_based_auth_properties.value.status
    }
  }

  dynamic "saml_properties" {
    for_each = each.value.saml_properties != null ? each.value.saml_properties : []
    content {
      relay_state_parameter_name = saml_properties.value.relay_state_parameter_name
      status                     = saml_properties.value.status
      user_access_url            = saml_properties.value.user_access_url
    }
  }

  dynamic "self_service_permissions" {
    for_each = each.value.self_service_permissions != null ? each.value.self_service_permissions : []
    content {
      change_compute_type  = self_service_permissions.value.change_compute_type
      increase_volume_size = self_service_permissions.value.increase_volume_size
      rebuild_workspace    = self_service_permissions.value.rebuild_workspace
      restart_workspace    = self_service_permissions.value.restart_workspace
      switch_running_mode  = self_service_permissions.value.switch_running_mode
    }
  }

  dynamic "workspace_access_properties" {
    for_each = each.value.workspace_access_properties != null ? each.value.workspace_access_properties : []
    content {
      device_type_android    = workspace_access_properties.value.device_type_android
      device_type_chromeos   = workspace_access_properties.value.device_type_chromeos
      device_type_ios        = workspace_access_properties.value.device_type_ios
      device_type_linux      = workspace_access_properties.value.device_type_linux
      device_type_osx        = workspace_access_properties.value.device_type_osx
      device_type_web        = workspace_access_properties.value.device_type_web
      device_type_windows    = workspace_access_properties.value.device_type_windows
      device_type_zeroclient = workspace_access_properties.value.device_type_zeroclient

      dynamic "access_endpoint_config" {
        for_each = workspace_access_properties.value.access_endpoint_config != null ? workspace_access_properties.value.access_endpoint_config : []
        content {
          internet_fallback_protocols = access_endpoint_config.value.internet_fallback_protocols

          dynamic "access_endpoints" {
            for_each = access_endpoint_config.value.access_endpoints != null ? access_endpoint_config.value.access_endpoints : []
            content {
              access_endpoint_type = access_endpoints.value.access_endpoint_type
              vpc_endpoint_id      = access_endpoints.value.vpc_endpoint_id
            }
          }
        }
      }
    }
  }

  dynamic "workspace_creation_properties" {
    for_each = each.value.workspace_creation_properties != null ? each.value.workspace_creation_properties : []
    content {
      custom_security_group_id            = workspace_creation_properties.value.custom_security_group_id
      default_ou                          = workspace_creation_properties.value.default_ou
      enable_internet_access              = workspace_creation_properties.value.enable_internet_access
      enable_maintenance_mode             = workspace_creation_properties.value.enable_maintenance_mode
      user_enabled_as_local_administrator = workspace_creation_properties.value.user_enabled_as_local_administrator
    }
  }
}
