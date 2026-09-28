resource "aws_ses_domain_mail_from" "ses_domain_mail_froms" {
  for_each = var.ses_domain_mail_froms

  domain                 = each.value.domain
  mail_from_domain       = each.value.mail_from_domain
  behavior_on_mx_failure = each.value.behavior_on_mx_failure
  region                 = each.value.region
}
