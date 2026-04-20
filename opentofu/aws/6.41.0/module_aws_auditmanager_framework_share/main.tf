resource "aws_auditmanager_framework_share" "auditmanager_framework_shares" {
  for_each = var.auditmanager_framework_shares

  destination_account = each.value.destination_account
  destination_region  = each.value.destination_region
  framework_id        = each.value.framework_id
  comment             = each.value.comment
  region              = each.value.region
}
