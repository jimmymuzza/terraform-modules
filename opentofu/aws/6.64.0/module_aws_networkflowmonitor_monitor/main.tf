resource "aws_networkflowmonitor_monitor" "networkflowmonitor_monitors" {
  for_each = var.networkflowmonitor_monitors

  monitor_name = each.value.monitor_name
  scope_arn    = each.value.scope_arn
  region       = each.value.region
  tags         = each.value.tags

  dynamic "local_resource" {
    for_each = each.value.local_resource != null ? each.value.local_resource : []
    content {
      identifier = local_resource.value.identifier
      type       = local_resource.value.type
    }
  }

  dynamic "remote_resource" {
    for_each = each.value.remote_resource != null ? each.value.remote_resource : []
    content {
      identifier = remote_resource.value.identifier
      type       = remote_resource.value.type
    }
  }
}
