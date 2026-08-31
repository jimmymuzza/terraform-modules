resource "aws_ec2_managed_prefix_list" "ec2_managed_prefix_lists" {
  for_each = var.ec2_managed_prefix_lists

  address_family = each.value.address_family
  max_entries    = each.value.max_entries
  name           = each.value.name
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  dynamic "entry" {
    for_each = each.value.entry != null ? each.value.entry : []
    content {
      cidr        = entry.value.cidr
      description = entry.value.description
    }
  }
}
