resource "aws_detective_organization_configuration" "detective_organization_configurations" {
  for_each = var.detective_organization_configurations

  auto_enable = each.value.auto_enable
  graph_arn   = each.value.graph_arn
  region      = each.value.region
}
