resource "aws_ses_email_identity" "ses_email_identities" {
  for_each = var.ses_email_identities

  email  = each.value.email
  region = each.value.region
}
