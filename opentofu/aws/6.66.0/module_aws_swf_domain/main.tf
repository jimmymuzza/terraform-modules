resource "aws_swf_domain" "swf_domains" {
  for_each = var.swf_domains

  workflow_execution_retention_period_in_days = each.value.workflow_execution_retention_period_in_days
  description                                 = each.value.description
  name                                        = each.value.name
  name_prefix                                 = each.value.name_prefix
  region                                      = each.value.region
  tags                                        = each.value.tags
  tags_all                                    = each.value.tags_all
}
