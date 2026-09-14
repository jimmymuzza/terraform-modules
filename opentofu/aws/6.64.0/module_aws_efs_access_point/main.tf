resource "aws_efs_access_point" "efs_access_points" {
  for_each = var.efs_access_points

  file_system_id = each.value.file_system_id
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

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

      dynamic "creation_info" {
        for_each = root_directory.value.creation_info != null ? root_directory.value.creation_info : []
        content {
          owner_gid   = creation_info.value.owner_gid
          owner_uid   = creation_info.value.owner_uid
          permissions = creation_info.value.permissions
        }
      }
    }
  }
}
