resource "aws_dax_subnet_group" "dax_subnet_groups" {
  for_each = var.dax_subnet_groups

  name        = each.value.name
  subnet_ids  = each.value.subnet_ids
  description = each.value.description
  region      = each.value.region
}
