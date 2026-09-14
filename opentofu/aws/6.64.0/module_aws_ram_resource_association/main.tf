resource "aws_ram_resource_association" "ram_resource_associations" {
  for_each = var.ram_resource_associations

  resource_arn       = each.value.resource_arn
  resource_share_arn = each.value.resource_share_arn
  region             = each.value.region
}
