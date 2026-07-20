resource "aws_glacier_vault" "glacier_vaults" {
  for_each = var.glacier_vaults

  name          = each.value.name
  access_policy = each.value.access_policy
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "notification" {
    for_each = each.value.notification != null ? each.value.notification : []
    content {
      events    = notification.value.events
      sns_topic = notification.value.sns_topic
    }
  }
}
