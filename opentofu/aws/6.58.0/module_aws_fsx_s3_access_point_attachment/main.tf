resource "aws_fsx_s3_access_point_attachment" "fsx_s3_access_point_attachments" {
  for_each = var.fsx_s3_access_point_attachments

  name   = each.value.name
  type   = each.value.type
  region = each.value.region

  dynamic "openzfs_configuration" {
    for_each = each.value.openzfs_configuration != null ? each.value.openzfs_configuration : []
    content {
      volume_id = openzfs_configuration.value.volume_id

      dynamic "file_system_identity" {
        for_each = openzfs_configuration.value.file_system_identity != null ? openzfs_configuration.value.file_system_identity : []
        content {
          type = file_system_identity.value.type

          dynamic "posix_user" {
            for_each = file_system_identity.value.posix_user != null ? file_system_identity.value.posix_user : []
            content {
              gid            = posix_user.value.gid
              uid            = posix_user.value.uid
              secondary_gids = posix_user.value.secondary_gids
            }
          }
        }
      }
    }
  }

  dynamic "s3_access_point" {
    for_each = each.value.s3_access_point != null ? each.value.s3_access_point : []
    content {
      policy = s3_access_point.value.policy

      dynamic "vpc_configuration" {
        for_each = s3_access_point.value.vpc_configuration != null ? s3_access_point.value.vpc_configuration : []
        content {
          vpc_id = vpc_configuration.value.vpc_id
        }
      }
    }
  }
}
