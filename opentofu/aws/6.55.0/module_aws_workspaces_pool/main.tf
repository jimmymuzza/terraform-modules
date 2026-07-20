resource "aws_workspaces_pool" "workspaces_pools" {
  for_each = var.workspaces_pools

  bundle_id            = each.value.bundle_id
  description          = each.value.description
  directory_id         = each.value.directory_id
  pool_name            = each.value.pool_name
  running_mode         = each.value.running_mode
  application_settings = each.value.application_settings
  region               = each.value.region
  tags                 = each.value.tags
  timeout_settings     = each.value.timeout_settings

  dynamic "capacity" {
    for_each = each.value.capacity != null ? each.value.capacity : []
    content {
      desired_user_sessions = capacity.value.desired_user_sessions
    }
  }
}
