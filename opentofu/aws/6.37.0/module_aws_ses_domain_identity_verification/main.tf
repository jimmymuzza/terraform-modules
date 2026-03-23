resource "aws_ses_domain_identity_verification" "ses_domain_identity_verifications" {
  for_each = var.ses_domain_identity_verifications

  domain = each.value.domain
  region = each.value.region
}
