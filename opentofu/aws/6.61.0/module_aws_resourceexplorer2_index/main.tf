resource "aws_resourceexplorer2_index" "resourceexplorer2_indexes" {
  for_each = var.resourceexplorer2_indexes

  type   = each.value.type
  region = each.value.region
  tags   = each.value.tags
}
