resource "aws_datasync_location_smb" "datasync_location_smbs" {
  for_each = var.datasync_location_smbs

  agent_arns      = each.value.agent_arns
  password        = each.value.password
  server_hostname = each.value.server_hostname
  subdirectory    = each.value.subdirectory
  user            = each.value.user
  domain          = each.value.domain
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "mount_options" {
    for_each = each.value.mount_options != null ? each.value.mount_options : []
    content {
      version = mount_options.value.version
    }
  }
}
