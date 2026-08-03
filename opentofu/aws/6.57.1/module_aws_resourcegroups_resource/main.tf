resource "aws_resourcegroups_resource" "resourcegroups_resources" {
  for_each = var.resourcegroups_resources

  group_arn    = each.value.group_arn
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
