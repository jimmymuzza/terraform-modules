resource "aws_securityhub_finding_aggregator" "securityhub_finding_aggregators" {
  for_each = var.securityhub_finding_aggregators

  linking_mode      = each.value.linking_mode
  region            = each.value.region
  specified_regions = each.value.specified_regions
}
