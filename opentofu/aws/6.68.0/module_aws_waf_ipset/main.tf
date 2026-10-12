resource "aws_waf_ipset" "waf_ipsets" {
  for_each = var.waf_ipsets

  name = each.value.name

  dynamic "ip_set_descriptors" {
    for_each = each.value.ip_set_descriptors != null ? each.value.ip_set_descriptors : []
    content {
      type  = ip_set_descriptors.value.type
      value = ip_set_descriptors.value.value
    }
  }
}
