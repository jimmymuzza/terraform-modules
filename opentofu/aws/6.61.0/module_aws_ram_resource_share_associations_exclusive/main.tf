resource "aws_ram_resource_share_associations_exclusive" "ram_resource_share_associations_exclusives" {
  for_each = var.ram_resource_share_associations_exclusives

  resource_share_arn = each.value.resource_share_arn
  principals         = each.value.principals
  region             = each.value.region
  resource_arns      = each.value.resource_arns
  sources            = each.value.sources
}
