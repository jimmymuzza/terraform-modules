resource "aws_auditmanager_organization_admin_account_registration" "auditmanager_organization_admin_account_registrations" {
  for_each = var.auditmanager_organization_admin_account_registrations

  admin_account_id = each.value.admin_account_id
  region           = each.value.region
}
