resource "aws_datasync_location_fsx_ontap_file_system" "datasync_location_fsx_ontap_file_systems" {
  for_each = var.datasync_location_fsx_ontap_file_systems

  security_group_arns         = each.value.security_group_arns
  storage_virtual_machine_arn = each.value.storage_virtual_machine_arn
  region                      = each.value.region
  subdirectory                = each.value.subdirectory
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

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

      dynamic "smb" {
        for_each = protocol.value.smb != null ? protocol.value.smb : []
        content {
          password = smb.value.password
          user     = smb.value.user
          domain   = smb.value.domain

          dynamic "mount_options" {
            for_each = smb.value.mount_options != null ? smb.value.mount_options : []
            content {
              version = mount_options.value.version
            }
          }
        }
      }
    }
  }
}
