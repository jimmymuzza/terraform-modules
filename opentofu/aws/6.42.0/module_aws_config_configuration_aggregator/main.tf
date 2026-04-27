resource "aws_config_configuration_aggregator" "config_configuration_aggregators" {
  for_each = var.config_configuration_aggregators

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "account_aggregation_source" {
    for_each = each.value.account_aggregation_source != null ? each.value.account_aggregation_source : []
    content {
      account_ids = account_aggregation_source.value.account_ids
      all_regions = account_aggregation_source.value.all_regions
      regions     = account_aggregation_source.value.regions
    }
  }

  dynamic "organization_aggregation_source" {
    for_each = each.value.organization_aggregation_source != null ? each.value.organization_aggregation_source : []
    content {
      role_arn    = organization_aggregation_source.value.role_arn
      all_regions = organization_aggregation_source.value.all_regions
      regions     = organization_aggregation_source.value.regions
    }
  }
}
