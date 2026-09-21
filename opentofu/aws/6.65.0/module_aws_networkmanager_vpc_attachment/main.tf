resource "aws_networkmanager_vpc_attachment" "networkmanager_vpc_attachments" {
  for_each = var.networkmanager_vpc_attachments

  core_network_id      = each.value.core_network_id
  subnet_arns          = each.value.subnet_arns
  vpc_arn              = each.value.vpc_arn
  routing_policy_label = each.value.routing_policy_label
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      appliance_mode_support             = options.value.appliance_mode_support
      dns_support                        = options.value.dns_support
      ipv6_support                       = options.value.ipv6_support
      security_group_referencing_support = options.value.security_group_referencing_support
    }
  }
}
