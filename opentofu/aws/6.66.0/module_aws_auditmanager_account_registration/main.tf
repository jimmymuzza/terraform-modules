resource "aws_auditmanager_account_registration" "auditmanager_account_registrations" {
  for_each = var.auditmanager_account_registrations

  delegated_admin_account = each.value.delegated_admin_account
  deregister_on_destroy   = each.value.deregister_on_destroy
  kms_key                 = each.value.kms_key
  region                  = each.value.region
}
