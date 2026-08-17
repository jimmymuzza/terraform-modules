resource "aws_inspector_assessment_target" "inspector_assessment_targets" {
  for_each = var.inspector_assessment_targets

  name               = each.value.name
  region             = each.value.region
  resource_group_arn = each.value.resource_group_arn
}
