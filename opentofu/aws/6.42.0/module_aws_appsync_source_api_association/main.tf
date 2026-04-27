resource "aws_appsync_source_api_association" "appsync_source_api_associations" {
  for_each = var.appsync_source_api_associations

  description                   = each.value.description
  merged_api_arn                = each.value.merged_api_arn
  merged_api_id                 = each.value.merged_api_id
  region                        = each.value.region
  source_api_arn                = each.value.source_api_arn
  source_api_association_config = each.value.source_api_association_config
  source_api_id                 = each.value.source_api_id
}
