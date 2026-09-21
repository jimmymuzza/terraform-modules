resource "aws_securityhub_aggregator_v2" "securityhub_aggregator_v2s" {
  for_each = var.securityhub_aggregator_v2s

  region_linking_mode = each.value.region_linking_mode
  linked_regions      = each.value.linked_regions
  region              = each.value.region
  tags                = each.value.tags
}
