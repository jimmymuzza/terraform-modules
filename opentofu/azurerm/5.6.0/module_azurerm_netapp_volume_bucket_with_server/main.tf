resource "azurerm_netapp_volume_bucket_with_server" "netapp_volume_bucket_with_servers" {
  for_each = var.netapp_volume_bucket_with_servers

  name                      = each.value.name
  volume_id                 = each.value.volume_id
  file_system_cifs_username = each.value.file_system_cifs_username
  path                      = each.value.path
  permissions               = each.value.permissions

  dynamic "file_system_nfs_user" {
    for_each = each.value.file_system_nfs_user != null ? each.value.file_system_nfs_user : []
    content {
      group_id = file_system_nfs_user.value.group_id
      user_id  = file_system_nfs_user.value.user_id
    }
  }

  dynamic "key_vault" {
    for_each = each.value.key_vault != null ? each.value.key_vault : []
    content {
      certificate_key_vault_uri = key_vault.value.certificate_key_vault_uri
      certificate_name          = key_vault.value.certificate_name
      credentials_key_vault_uri = key_vault.value.credentials_key_vault_uri
      credentials_secret_name   = key_vault.value.credentials_secret_name
    }
  }

  dynamic "server" {
    for_each = each.value.server != null ? each.value.server : []
    content {
      fqdn                           = server.value.fqdn
      certificate_pem                = server.value.certificate_pem
      on_certificate_conflict_action = server.value.on_certificate_conflict_action
    }
  }
}
