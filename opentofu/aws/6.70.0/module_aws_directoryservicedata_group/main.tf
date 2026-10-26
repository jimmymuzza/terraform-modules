resource "aws_directoryservicedata_group" "directoryservicedata_groups" {
  for_each = var.directoryservicedata_groups

  directory_id     = each.value.directory_id
  sam_account_name = each.value.sam_account_name
  group_scope      = each.value.group_scope
  group_type       = each.value.group_type
  region           = each.value.region
}
