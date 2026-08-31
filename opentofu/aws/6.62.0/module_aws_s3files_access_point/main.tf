resource "aws_s3files_access_point" "s3files_access_points" {
  for_each = var.s3files_access_points

  file_system_id = each.value.file_system_id
  region         = each.value.region
  tags           = each.value.tags

  dynamic "posix_user" {
    for_each = each.value.posix_user != null ? each.value.posix_user : []
    content {
      gid            = posix_user.value.gid
      uid            = posix_user.value.uid
      secondary_gids = posix_user.value.secondary_gids
    }
  }

  dynamic "root_directory" {
    for_each = each.value.root_directory != null ? each.value.root_directory : []
    content {
      path = root_directory.value.path

      dynamic "creation_permissions" {
        for_each = root_directory.value.creation_permissions != null ? root_directory.value.creation_permissions : []
        content {
          owner_gid   = creation_permissions.value.owner_gid
          owner_uid   = creation_permissions.value.owner_uid
          permissions = creation_permissions.value.permissions
        }
      }
    }
  }
}
