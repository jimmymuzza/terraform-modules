resource "aws_transfer_tag" "transfer_tags" {
  for_each = var.transfer_tags

  key          = each.value.key
  resource_arn = each.value.resource_arn
  value        = each.value.value
  region       = each.value.region
}
