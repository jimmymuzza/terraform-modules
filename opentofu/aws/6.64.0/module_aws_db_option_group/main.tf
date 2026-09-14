resource "aws_db_option_group" "db_option_groups" {
  for_each = var.db_option_groups

  engine_name              = each.value.engine_name
  major_engine_version     = each.value.major_engine_version
  name                     = each.value.name
  name_prefix              = each.value.name_prefix
  option_group_description = each.value.option_group_description
  region                   = each.value.region
  skip_destroy             = each.value.skip_destroy
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all

  dynamic "option" {
    for_each = each.value.option != null ? each.value.option : []
    content {
      option_name                    = option.value.option_name
      db_security_group_memberships  = option.value.db_security_group_memberships
      port                           = option.value.port
      version                        = option.value.version
      vpc_security_group_memberships = option.value.vpc_security_group_memberships

      dynamic "option_settings" {
        for_each = option.value.option_settings != null ? option.value.option_settings : []
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }
}
