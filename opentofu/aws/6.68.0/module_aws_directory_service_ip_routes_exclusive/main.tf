resource "aws_directory_service_ip_routes_exclusive" "directory_service_ip_routes_exclusives" {
  for_each = var.directory_service_ip_routes_exclusives

  directory_id                                    = each.value.directory_id
  region                                          = each.value.region
  update_security_group_for_directory_controllers = each.value.update_security_group_for_directory_controllers

  dynamic "ip_route" {
    for_each = each.value.ip_route != null ? each.value.ip_route : []
    content {
      cidr_ip     = ip_route.value.cidr_ip
      cidr_ipv6   = ip_route.value.cidr_ipv6
      description = ip_route.value.description
    }
  }
}
