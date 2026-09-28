resource "aws_schemas_discoverer" "schemas_discoverers" {
  for_each = var.schemas_discoverers

  source_arn  = each.value.source_arn
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
