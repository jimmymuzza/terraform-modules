resource "aws_datasync_location_nfs" "datasync_location_nfs" {
  for_each = var.datasync_location_nfs

  server_hostname = each.value.server_hostname
  subdirectory    = each.value.subdirectory
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "mount_options" {
    for_each = each.value.mount_options != null ? each.value.mount_options : []
    content {
      version = mount_options.value.version
    }
  }

  dynamic "on_prem_config" {
    for_each = each.value.on_prem_config != null ? each.value.on_prem_config : []
    content {
      agent_arns = on_prem_config.value.agent_arns
    }
  }
}
