resource "aws_shield_protection" "shield_protections" {
  for_each = var.shield_protections

  name         = each.value.name
  resource_arn = each.value.resource_arn
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
