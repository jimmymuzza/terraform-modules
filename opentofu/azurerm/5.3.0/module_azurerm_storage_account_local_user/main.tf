resource "azurerm_storage_account_local_user" "storage_account_local_users" {
  for_each = var.storage_account_local_users

  name                 = each.value.name
  storage_account_id   = each.value.storage_account_id
  home_directory       = each.value.home_directory
  ssh_key_enabled      = each.value.ssh_key_enabled
  ssh_password_enabled = each.value.ssh_password_enabled

  dynamic "permission_scope" {
    for_each = each.value.permission_scope != null ? each.value.permission_scope : []
    content {
      resource_name = permission_scope.value.resource_name
      service       = permission_scope.value.service

      dynamic "permissions" {
        for_each = permission_scope.value.permissions != null ? permission_scope.value.permissions : []
        content {
          create = permissions.value.create
          delete = permissions.value.delete
          list   = permissions.value.list
          read   = permissions.value.read
          write  = permissions.value.write
        }
      }
    }
  }

  dynamic "ssh_authorized_key" {
    for_each = each.value.ssh_authorized_key != null ? each.value.ssh_authorized_key : []
    content {
      key         = ssh_authorized_key.value.key
      description = ssh_authorized_key.value.description
    }
  }
}
