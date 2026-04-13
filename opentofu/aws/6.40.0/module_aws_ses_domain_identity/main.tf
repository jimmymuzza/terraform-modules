resource "aws_ses_domain_identity" "ses_domain_identities" {
  for_each = var.ses_domain_identities

  domain = each.value.domain
  region = each.value.region
}
