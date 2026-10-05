resource "aws_account_alternate_contact" "account_alternate_contacts" {
  for_each = var.account_alternate_contacts

  alternate_contact_type = each.value.alternate_contact_type
  email_address          = each.value.email_address
  name                   = each.value.name
  phone_number           = each.value.phone_number
  title                  = each.value.title
  account_id             = each.value.account_id
}
