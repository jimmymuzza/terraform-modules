resource "aws_organizations_policy" "organizations_policies" {
  for_each = var.organizations_policies

  content      = each.value.content
  name         = each.value.name
  description  = each.value.description
  skip_destroy = each.value.skip_destroy
  tags         = each.value.tags
  tags_all     = each.value.tags_all
  type         = each.value.type
}
