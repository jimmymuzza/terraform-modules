resource "aws_xray_sampling_rule" "xray_sampling_rules" {
  for_each = var.xray_sampling_rules

  fixed_rate     = each.value.fixed_rate
  host           = each.value.host
  http_method    = each.value.http_method
  priority       = each.value.priority
  reservoir_size = each.value.reservoir_size
  resource_arn   = each.value.resource_arn
  service_name   = each.value.service_name
  service_type   = each.value.service_type
  url_path       = each.value.url_path
  version        = each.value.version
  attributes     = each.value.attributes
  region         = each.value.region
  rule_name      = each.value.rule_name
  tags           = each.value.tags
  tags_all       = each.value.tags_all
}
