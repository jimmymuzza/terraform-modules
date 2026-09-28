resource "aws_ram_principal_association" "ram_principal_associations" {
  for_each = var.ram_principal_associations

  principal          = each.value.principal
  resource_share_arn = each.value.resource_share_arn
  region             = each.value.region
}
