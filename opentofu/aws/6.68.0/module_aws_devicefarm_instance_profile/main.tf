resource "aws_devicefarm_instance_profile" "devicefarm_instance_profiles" {
  for_each = var.devicefarm_instance_profiles

  name                              = each.value.name
  description                       = each.value.description
  exclude_app_packages_from_cleanup = each.value.exclude_app_packages_from_cleanup
  package_cleanup                   = each.value.package_cleanup
  reboot_after_use                  = each.value.reboot_after_use
  region                            = each.value.region
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
}
