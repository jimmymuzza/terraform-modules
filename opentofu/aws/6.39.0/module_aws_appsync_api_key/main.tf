resource "aws_appsync_api_key" "appsync_api_keys" {
  for_each = var.appsync_api_keys

  api_id      = each.value.api_id
  description = each.value.description
  expires     = each.value.expires
  region      = each.value.region
}
