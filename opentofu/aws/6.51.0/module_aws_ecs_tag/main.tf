resource "aws_ecs_tag" "ecs_tags" {
  for_each = var.ecs_tags

  key          = each.value.key
  resource_arn = each.value.resource_arn
  value        = each.value.value
  region       = each.value.region
}
