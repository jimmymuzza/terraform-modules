resource "azurerm_nginx_deployment" "nginx_deployments" {
  for_each = var.nginx_deployments

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  sku                       = each.value.sku
  automatic_upgrade_channel = each.value.automatic_upgrade_channel
  capacity                  = each.value.capacity
  diagnose_support_enabled  = each.value.diagnose_support_enabled
  email                     = each.value.email
  managed_resource_group    = each.value.managed_resource_group
  tags                      = each.value.tags

  dynamic "auto_scale_profile" {
    for_each = each.value.auto_scale_profile != null ? each.value.auto_scale_profile : []
    content {
      max_capacity = auto_scale_profile.value.max_capacity
      min_capacity = auto_scale_profile.value.min_capacity
      name         = auto_scale_profile.value.name
    }
  }

  dynamic "frontend_private" {
    for_each = each.value.frontend_private != null ? each.value.frontend_private : []
    content {
      allocation_method = frontend_private.value.allocation_method
      ip_address        = frontend_private.value.ip_address
      subnet_id         = frontend_private.value.subnet_id
    }
  }

  dynamic "frontend_public" {
    for_each = each.value.frontend_public != null ? each.value.frontend_public : []
    content {
      ip_address = frontend_public.value.ip_address
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "logging_storage_account" {
    for_each = each.value.logging_storage_account != null ? each.value.logging_storage_account : []
    content {
      container_name = logging_storage_account.value.container_name
      name           = logging_storage_account.value.name
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interface != null ? each.value.network_interface : []
    content {
      subnet_id = network_interface.value.subnet_id
    }
  }

  dynamic "web_application_firewall" {
    for_each = each.value.web_application_firewall != null ? each.value.web_application_firewall : []
    content {
      activation_state_enabled = web_application_firewall.value.activation_state_enabled
    }
  }
}
