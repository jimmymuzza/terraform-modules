resource "aws_dynamodb_contributor_insights" "dynamodb_contributor_insights" {
  for_each = var.dynamodb_contributor_insights

  table_name = each.value.table_name
  index_name = each.value.index_name
  mode       = each.value.mode
  region     = each.value.region
}
