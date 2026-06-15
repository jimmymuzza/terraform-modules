resource "aws_datasync_location_fsx_lustre_file_system" "datasync_location_fsx_lustre_file_systems" {
  for_each = var.datasync_location_fsx_lustre_file_systems

  fsx_filesystem_arn  = each.value.fsx_filesystem_arn
  security_group_arns = each.value.security_group_arns
  region              = each.value.region
  subdirectory        = each.value.subdirectory
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
