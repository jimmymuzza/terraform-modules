resource "aws_organizations_delegated_administrator" "organizations_delegated_administrators" {
  for_each = var.organizations_delegated_administrators

  account_id        = each.value.account_id
  service_principal = each.value.service_principal
}
