resource "aws_devicefarm_device_pool" "devicefarm_device_pools" {
  for_each = var.devicefarm_device_pools

  name        = each.value.name
  project_arn = each.value.project_arn
  description = each.value.description
  max_devices = each.value.max_devices
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      attribute = rule.value.attribute
      operator  = rule.value.operator
      value     = rule.value.value
    }
  }
}
