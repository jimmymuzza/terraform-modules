resource "aws_mailmanager_archive" "mailmanager_archives" {
  for_each = var.mailmanager_archives

  name        = each.value.name
  kms_key_arn = each.value.kms_key_arn
  region      = each.value.region
  tags        = each.value.tags

  dynamic "retention" {
    for_each = each.value.retention != null ? each.value.retention : []
    content {
      retention_period = retention.value.retention_period
    }
  }
}
