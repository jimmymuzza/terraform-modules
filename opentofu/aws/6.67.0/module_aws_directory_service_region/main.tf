resource "aws_directory_service_region" "directory_service_regions" {
  for_each = var.directory_service_regions

  directory_id                         = each.value.directory_id
  region_name                          = each.value.region_name
  desired_number_of_domain_controllers = each.value.desired_number_of_domain_controllers
  region                               = each.value.region
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all

  dynamic "vpc_settings" {
    for_each = each.value.vpc_settings != null ? each.value.vpc_settings : []
    content {
      subnet_ids = vpc_settings.value.subnet_ids
      vpc_id     = vpc_settings.value.vpc_id
    }
  }
}
