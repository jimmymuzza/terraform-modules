resource "aws_directory_service_ip_route" "directory_service_ip_routes" {
  for_each = var.directory_service_ip_routes

  directory_id                                    = each.value.directory_id
  cidr_ip                                         = each.value.cidr_ip
  cidr_ipv6                                       = each.value.cidr_ipv6
  description                                     = each.value.description
  region                                          = each.value.region
  update_security_group_for_directory_controllers = each.value.update_security_group_for_directory_controllers
}
