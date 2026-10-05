resource "azurerm_active_directory_domain_service" "active_directory_domain_services" {
  for_each = var.active_directory_domain_services

  domain_name               = each.value.domain_name
  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  sku                       = each.value.sku
  domain_configuration_type = each.value.domain_configuration_type
  filtered_sync_enabled     = each.value.filtered_sync_enabled
  tags                      = each.value.tags

  dynamic "initial_replica_set" {
    for_each = each.value.initial_replica_set != null ? each.value.initial_replica_set : []
    content {
      subnet_id = initial_replica_set.value.subnet_id
    }
  }

  dynamic "notifications" {
    for_each = each.value.notifications != null ? each.value.notifications : []
    content {
      additional_recipients = notifications.value.additional_recipients
      notify_dc_admins      = notifications.value.notify_dc_admins
      notify_global_admins  = notifications.value.notify_global_admins
    }
  }

  dynamic "secure_ldap" {
    for_each = each.value.secure_ldap != null ? each.value.secure_ldap : []
    content {
      enabled                  = secure_ldap.value.enabled
      pfx_certificate          = secure_ldap.value.pfx_certificate
      pfx_certificate_password = secure_ldap.value.pfx_certificate_password
      external_access_enabled  = secure_ldap.value.external_access_enabled
    }
  }

  dynamic "security" {
    for_each = each.value.security != null ? each.value.security : []
    content {
      kerberos_armoring_enabled       = security.value.kerberos_armoring_enabled
      kerberos_rc4_encryption_enabled = security.value.kerberos_rc4_encryption_enabled
      ntlm_v1_enabled                 = security.value.ntlm_v1_enabled
      sync_kerberos_passwords         = security.value.sync_kerberos_passwords
      sync_ntlm_passwords             = security.value.sync_ntlm_passwords
      sync_on_prem_passwords          = security.value.sync_on_prem_passwords
      tls_v1_enabled                  = security.value.tls_v1_enabled
    }
  }
}
