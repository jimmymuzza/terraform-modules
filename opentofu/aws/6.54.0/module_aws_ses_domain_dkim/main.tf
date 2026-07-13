resource "aws_ses_domain_dkim" "ses_domain_dkims" {
  for_each = var.ses_domain_dkims

  domain = each.value.domain
  region = each.value.region
}
