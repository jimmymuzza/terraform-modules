resource "aws_dynamodb_tag" "dynamodb_tags" {
  for_each = var.dynamodb_tags

  key          = each.value.key
  resource_arn = each.value.resource_arn
  value        = each.value.value
  region       = each.value.region
}
