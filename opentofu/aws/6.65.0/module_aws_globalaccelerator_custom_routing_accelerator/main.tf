resource "aws_globalaccelerator_custom_routing_accelerator" "globalaccelerator_custom_routing_accelerators" {
  for_each = var.globalaccelerator_custom_routing_accelerators

  name            = each.value.name
  enabled         = each.value.enabled
  ip_address_type = each.value.ip_address_type
  ip_addresses    = each.value.ip_addresses
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "attributes" {
    for_each = each.value.attributes != null ? each.value.attributes : []
    content {
      flow_logs_enabled   = attributes.value.flow_logs_enabled
      flow_logs_s3_bucket = attributes.value.flow_logs_s3_bucket
      flow_logs_s3_prefix = attributes.value.flow_logs_s3_prefix
    }
  }
}
