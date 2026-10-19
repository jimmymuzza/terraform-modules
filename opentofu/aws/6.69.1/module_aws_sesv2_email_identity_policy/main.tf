resource "aws_sesv2_email_identity_policy" "sesv2_email_identity_policies" {
  for_each = var.sesv2_email_identity_policies

  email_identity = each.value.email_identity
  policy         = each.value.policy
  policy_name    = each.value.policy_name
  region         = each.value.region
}
