resource "aws_dynamodb_global_table" "dynamodb_global_tables" {
  for_each = var.dynamodb_global_tables

  name   = each.value.name
  region = each.value.region

  dynamic "replica" {
    for_each = each.value.replica != null ? each.value.replica : []
    content {
      region_name = replica.value.region_name
    }
  }
}
