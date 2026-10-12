resource "aws_evidently_segment" "evidently_segments" {
  for_each = var.evidently_segments

  name        = each.value.name
  pattern     = each.value.pattern
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
