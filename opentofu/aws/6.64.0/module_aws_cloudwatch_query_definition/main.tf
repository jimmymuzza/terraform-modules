resource "aws_cloudwatch_query_definition" "cloudwatch_query_definitions" {
  for_each = var.cloudwatch_query_definitions

  name            = each.value.name
  query_string    = each.value.query_string
  log_group_names = each.value.log_group_names
  region          = each.value.region
}
