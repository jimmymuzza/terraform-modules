resource "aws_notifications_organizations_access" "notifications_organizations_accesses" {
  for_each = var.notifications_organizations_accesses

  enabled = each.value.enabled
}
