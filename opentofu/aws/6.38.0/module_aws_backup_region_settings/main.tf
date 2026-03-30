resource "aws_backup_region_settings" "backup_region_settings" {
  for_each = var.backup_region_settings

  resource_type_opt_in_preference     = each.value.resource_type_opt_in_preference
  region                              = each.value.region
  resource_type_management_preference = each.value.resource_type_management_preference
}
