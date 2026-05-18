resource "aws_organizations_tag" "organizations_tags" {
  for_each = var.organizations_tags

  key         = each.value.key
  resource_id = each.value.resource_id
  value       = each.value.value
}
