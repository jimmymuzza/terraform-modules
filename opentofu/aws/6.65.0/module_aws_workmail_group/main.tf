resource "aws_workmail_group" "workmail_groups" {
  for_each = var.workmail_groups

  email                           = each.value.email
  name                            = each.value.name
  organization_id                 = each.value.organization_id
  hidden_from_global_address_list = each.value.hidden_from_global_address_list
  region                          = each.value.region
}
