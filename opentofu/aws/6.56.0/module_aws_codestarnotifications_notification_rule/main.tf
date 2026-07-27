resource "aws_codestarnotifications_notification_rule" "codestarnotifications_notification_rules" {
  for_each = var.codestarnotifications_notification_rules

  detail_type    = each.value.detail_type
  event_type_ids = each.value.event_type_ids
  name           = each.value.name
  resource       = each.value.resource
  region         = each.value.region
  status         = each.value.status
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  dynamic "target" {
    for_each = each.value.target != null ? each.value.target : []
    content {
      address = target.value.address
      type    = target.value.type
    }
  }
}
