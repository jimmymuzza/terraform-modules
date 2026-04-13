resource "aws_athena_named_query" "athena_named_queries" {
  for_each = var.athena_named_queries

  database    = each.value.database
  name        = each.value.name
  query       = each.value.query
  description = each.value.description
  region      = each.value.region
  workgroup   = each.value.workgroup
}
