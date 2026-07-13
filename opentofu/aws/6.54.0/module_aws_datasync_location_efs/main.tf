resource "aws_datasync_location_efs" "datasync_location_efs" {
  for_each = var.datasync_location_efs

  efs_file_system_arn         = each.value.efs_file_system_arn
  access_point_arn            = each.value.access_point_arn
  file_system_access_role_arn = each.value.file_system_access_role_arn
  in_transit_encryption       = each.value.in_transit_encryption
  region                      = each.value.region
  subdirectory                = each.value.subdirectory
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

  dynamic "ec2_config" {
    for_each = each.value.ec2_config != null ? each.value.ec2_config : []
    content {
      security_group_arns = ec2_config.value.security_group_arns
      subnet_arn          = ec2_config.value.subnet_arn
    }
  }
}
