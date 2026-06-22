resource "aws_organizations_resource_policy" "organizations_resource_policies" {
  for_each = var.organizations_resource_policies

  content  = each.value.content
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
