resource "aws_ec2_managed_prefix_list_entry" "ec2_managed_prefix_list_entries" {
  for_each = var.ec2_managed_prefix_list_entries

  cidr           = each.value.cidr
  prefix_list_id = each.value.prefix_list_id
  description    = each.value.description
  region         = each.value.region
}
