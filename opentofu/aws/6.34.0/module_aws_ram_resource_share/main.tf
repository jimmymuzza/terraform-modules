resource "aws_ram_resource_share" "ram_resource_shares" {
  for_each = var.ram_resource_shares

  name                      = each.value.name
  allow_external_principals = each.value.allow_external_principals
  permission_arns           = each.value.permission_arns
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
}
