resource "aws_workspaces_workspace" "workspaces_workspaces" {
  for_each = var.workspaces_workspaces

  bundle_id                      = each.value.bundle_id
  directory_id                   = each.value.directory_id
  user_name                      = each.value.user_name
  region                         = each.value.region
  root_volume_encryption_enabled = each.value.root_volume_encryption_enabled
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
  user_volume_encryption_enabled = each.value.user_volume_encryption_enabled
  volume_encryption_key          = each.value.volume_encryption_key

  dynamic "workspace_properties" {
    for_each = each.value.workspace_properties != null ? each.value.workspace_properties : []
    content {
      compute_type_name                         = workspace_properties.value.compute_type_name
      root_volume_size_gib                      = workspace_properties.value.root_volume_size_gib
      running_mode                              = workspace_properties.value.running_mode
      running_mode_auto_stop_timeout_in_minutes = workspace_properties.value.running_mode_auto_stop_timeout_in_minutes
      user_volume_size_gib                      = workspace_properties.value.user_volume_size_gib
    }
  }
}
