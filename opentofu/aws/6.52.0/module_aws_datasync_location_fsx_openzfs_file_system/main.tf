resource "aws_datasync_location_fsx_openzfs_file_system" "datasync_location_fsx_openzfs_file_systems" {
  for_each = var.datasync_location_fsx_openzfs_file_systems

  fsx_filesystem_arn  = each.value.fsx_filesystem_arn
  security_group_arns = each.value.security_group_arns
  region              = each.value.region
  subdirectory        = each.value.subdirectory
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "protocol" {
    for_each = each.value.protocol != null ? each.value.protocol : []
    content {

      dynamic "nfs" {
        for_each = protocol.value.nfs != null ? protocol.value.nfs : []
        content {

          dynamic "mount_options" {
            for_each = nfs.value.mount_options != null ? nfs.value.mount_options : []
            content {
              version = mount_options.value.version
            }
          }
        }
      }
    }
  }
}
