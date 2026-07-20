resource "aws_transfer_user" "transfer_users" {
  for_each = var.transfer_users

  role                = each.value.role
  server_id           = each.value.server_id
  user_name           = each.value.user_name
  home_directory      = each.value.home_directory
  home_directory_type = each.value.home_directory_type
  policy              = each.value.policy
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "home_directory_mappings" {
    for_each = each.value.home_directory_mappings != null ? each.value.home_directory_mappings : []
    content {
      entry  = home_directory_mappings.value.entry
      target = home_directory_mappings.value.target
    }
  }

  dynamic "posix_profile" {
    for_each = each.value.posix_profile != null ? each.value.posix_profile : []
    content {
      gid            = posix_profile.value.gid
      uid            = posix_profile.value.uid
      secondary_gids = posix_profile.value.secondary_gids
    }
  }
}
