resource "aws_wafregional_ipset" "wafregional_ipsets" {
  for_each = var.wafregional_ipsets

  name   = each.value.name
  region = each.value.region

  dynamic "ip_set_descriptor" {
    for_each = each.value.ip_set_descriptor != null ? each.value.ip_set_descriptor : []
    content {
      type  = ip_set_descriptor.value.type
      value = ip_set_descriptor.value.value
    }
  }
}
