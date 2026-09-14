resource "aws_appsync_type" "appsync_types" {
  for_each = var.appsync_types

  api_id     = each.value.api_id
  definition = each.value.definition
  format     = each.value.format
  region     = each.value.region
}
