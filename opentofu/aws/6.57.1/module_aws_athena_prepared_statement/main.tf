resource "aws_athena_prepared_statement" "athena_prepared_statements" {
  for_each = var.athena_prepared_statements

  name            = each.value.name
  query_statement = each.value.query_statement
  workgroup       = each.value.workgroup
  description     = each.value.description
  region          = each.value.region
}
