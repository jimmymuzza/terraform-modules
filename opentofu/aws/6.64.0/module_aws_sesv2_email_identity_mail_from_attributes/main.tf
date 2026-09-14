resource "aws_sesv2_email_identity_mail_from_attributes" "sesv2_email_identity_mail_from_attributes" {
  for_each = var.sesv2_email_identity_mail_from_attributes

  email_identity         = each.value.email_identity
  behavior_on_mx_failure = each.value.behavior_on_mx_failure
  mail_from_domain       = each.value.mail_from_domain
  region                 = each.value.region
}
