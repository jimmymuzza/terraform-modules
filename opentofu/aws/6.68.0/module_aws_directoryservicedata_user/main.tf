resource "aws_directoryservicedata_user" "directoryservicedata_users" {
  for_each = var.directoryservicedata_users

  directory_id     = each.value.directory_id
  sam_account_name = each.value.sam_account_name
  email_address    = each.value.email_address
  given_name       = each.value.given_name
  region           = each.value.region
  surname          = each.value.surname
}
