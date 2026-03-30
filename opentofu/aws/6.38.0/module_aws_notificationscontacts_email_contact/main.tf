resource "aws_notificationscontacts_email_contact" "notificationscontacts_email_contacts" {
  for_each = var.notificationscontacts_email_contacts

  email_address = each.value.email_address
  name          = each.value.name
  tags          = each.value.tags
}
