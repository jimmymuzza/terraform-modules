resource "azurerm_hpc_cache" "hpc_caches" {
  for_each = var.hpc_caches

  cache_size_in_gb                           = each.value.cache_size_in_gb
  location                                   = each.value.location
  name                                       = each.value.name
  resource_group_name                        = each.value.resource_group_name
  sku_name                                   = each.value.sku_name
  subnet_id                                  = each.value.subnet_id
  automatically_rotate_key_to_latest_enabled = each.value.automatically_rotate_key_to_latest_enabled
  key_vault_key_id                           = each.value.key_vault_key_id
  mtu                                        = each.value.mtu
  ntp_server                                 = each.value.ntp_server
  tags                                       = each.value.tags

  dynamic "default_access_policy" {
    for_each = each.value.default_access_policy != null ? each.value.default_access_policy : []
    content {

      dynamic "access_rule" {
        for_each = default_access_policy.value.access_rule != null ? default_access_policy.value.access_rule : []
        content {
          access                  = access_rule.value.access
          scope                   = access_rule.value.scope
          anonymous_gid           = access_rule.value.anonymous_gid
          anonymous_uid           = access_rule.value.anonymous_uid
          filter                  = access_rule.value.filter
          root_squash_enabled     = access_rule.value.root_squash_enabled
          submount_access_enabled = access_rule.value.submount_access_enabled
          suid_enabled            = access_rule.value.suid_enabled
        }
      }
    }
  }

  dynamic "directory_active_directory" {
    for_each = each.value.directory_active_directory != null ? each.value.directory_active_directory : []
    content {
      cache_netbios_name  = directory_active_directory.value.cache_netbios_name
      dns_primary_ip      = directory_active_directory.value.dns_primary_ip
      domain_name         = directory_active_directory.value.domain_name
      domain_netbios_name = directory_active_directory.value.domain_netbios_name
      password            = directory_active_directory.value.password
      username            = directory_active_directory.value.username
      dns_secondary_ip    = directory_active_directory.value.dns_secondary_ip
    }
  }

  dynamic "directory_flat_file" {
    for_each = each.value.directory_flat_file != null ? each.value.directory_flat_file : []
    content {
      group_file_uri    = directory_flat_file.value.group_file_uri
      password_file_uri = directory_flat_file.value.password_file_uri
    }
  }

  dynamic "directory_ldap" {
    for_each = each.value.directory_ldap != null ? each.value.directory_ldap : []
    content {
      base_dn                            = directory_ldap.value.base_dn
      server                             = directory_ldap.value.server
      certificate_validation_uri         = directory_ldap.value.certificate_validation_uri
      download_certificate_automatically = directory_ldap.value.download_certificate_automatically
      encrypted                          = directory_ldap.value.encrypted

      dynamic "bind" {
        for_each = directory_ldap.value.bind != null ? directory_ldap.value.bind : []
        content {
          dn       = bind.value.dn
          password = bind.value.password
        }
      }
    }
  }

  dynamic "dns" {
    for_each = each.value.dns != null ? each.value.dns : []
    content {
      servers       = dns.value.servers
      search_domain = dns.value.search_domain
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
