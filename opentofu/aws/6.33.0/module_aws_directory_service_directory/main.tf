resource "aws_directory_service_directory" "directory_service_directories" {
  for_each = var.directory_service_directories

  name                                 = each.value.name
  password                             = each.value.password
  alias                                = each.value.alias
  description                          = each.value.description
  desired_number_of_domain_controllers = each.value.desired_number_of_domain_controllers
  edition                              = each.value.edition
  enable_sso                           = each.value.enable_sso
  region                               = each.value.region
  short_name                           = each.value.short_name
  size                                 = each.value.size
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
  type                                 = each.value.type

  dynamic "connect_settings" {
    for_each = each.value.connect_settings != null ? each.value.connect_settings : []
    content {
      customer_dns_ips  = connect_settings.value.customer_dns_ips
      customer_username = connect_settings.value.customer_username
      subnet_ids        = connect_settings.value.subnet_ids
      vpc_id            = connect_settings.value.vpc_id
    }
  }

  dynamic "vpc_settings" {
    for_each = each.value.vpc_settings != null ? each.value.vpc_settings : []
    content {
      subnet_ids = vpc_settings.value.subnet_ids
      vpc_id     = vpc_settings.value.vpc_id
    }
  }
}
