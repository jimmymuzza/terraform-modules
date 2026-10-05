resource "aws_lightsail_instance_public_ports" "lightsail_instance_public_ports" {
  for_each = var.lightsail_instance_public_ports

  instance_name = each.value.instance_name
  region        = each.value.region

  dynamic "port_info" {
    for_each = each.value.port_info != null ? each.value.port_info : []
    content {
      from_port         = port_info.value.from_port
      protocol          = port_info.value.protocol
      to_port           = port_info.value.to_port
      cidr_list_aliases = port_info.value.cidr_list_aliases
      cidrs             = port_info.value.cidrs
      ipv6_cidrs        = port_info.value.ipv6_cidrs
    }
  }
}
