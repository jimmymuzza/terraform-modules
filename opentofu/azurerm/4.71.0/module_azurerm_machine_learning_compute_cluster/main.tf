resource "azurerm_machine_learning_compute_cluster" "machine_learning_compute_clusters" {
  for_each = var.machine_learning_compute_clusters

  location                      = each.value.location
  machine_learning_workspace_id = each.value.machine_learning_workspace_id
  name                          = each.value.name
  vm_priority                   = each.value.vm_priority
  vm_size                       = each.value.vm_size
  description                   = each.value.description
  local_auth_enabled            = each.value.local_auth_enabled
  node_public_ip_enabled        = each.value.node_public_ip_enabled
  ssh_public_access_enabled     = each.value.ssh_public_access_enabled
  subnet_resource_id            = each.value.subnet_resource_id
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "scale_settings" {
    for_each = each.value.scale_settings != null ? each.value.scale_settings : []
    content {
      max_node_count                       = scale_settings.value.max_node_count
      min_node_count                       = scale_settings.value.min_node_count
      scale_down_nodes_after_idle_duration = scale_settings.value.scale_down_nodes_after_idle_duration
    }
  }

  dynamic "ssh" {
    for_each = each.value.ssh != null ? each.value.ssh : []
    content {
      admin_username = ssh.value.admin_username
      admin_password = ssh.value.admin_password
      key_value      = ssh.value.key_value
    }
  }
}
