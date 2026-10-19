resource "aws_detective_graph" "detective_graphs" {
  for_each = var.detective_graphs

  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
