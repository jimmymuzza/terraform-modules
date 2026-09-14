resource "aws_dynamodb_table_item" "dynamodb_table_items" {
  for_each = var.dynamodb_table_items

  hash_key   = each.value.hash_key
  item       = each.value.item
  table_name = each.value.table_name
  range_key  = each.value.range_key
  region     = each.value.region
}
