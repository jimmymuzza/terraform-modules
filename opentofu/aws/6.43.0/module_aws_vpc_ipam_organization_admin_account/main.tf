resource "aws_vpc_ipam_organization_admin_account" "vpc_ipam_organization_admin_accounts" {
  for_each = var.vpc_ipam_organization_admin_accounts

  delegated_admin_account_id = each.value.delegated_admin_account_id
}
