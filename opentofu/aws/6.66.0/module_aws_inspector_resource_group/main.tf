resource "aws_inspector_resource_group" "inspector_resource_groups" {
  for_each = var.inspector_resource_groups

  tags   = each.value.tags
  region = each.value.region
}
