resource "azurerm_machine_learning_compute_instance" "machine_learning_compute_instances" {
  for_each = var.machine_learning_compute_instances

  machine_learning_workspace_id = each.value.machine_learning_workspace_id
  name                          = each.value.name
  virtual_machine_size          = each.value.virtual_machine_size
  authorization_type            = each.value.authorization_type
  description                   = each.value.description
  local_auth_enabled            = each.value.local_auth_enabled
  node_public_ip_enabled        = each.value.node_public_ip_enabled
  subnet_resource_id            = each.value.subnet_resource_id
  tags                          = each.value.tags

  dynamic "assign_to_user" {
    for_each = each.value.assign_to_user != null ? each.value.assign_to_user : []
    content {
      object_id = assign_to_user.value.object_id
      tenant_id = assign_to_user.value.tenant_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "ssh" {
    for_each = each.value.ssh != null ? each.value.ssh : []
    content {
      public_key = ssh.value.public_key
    }
  }
}
