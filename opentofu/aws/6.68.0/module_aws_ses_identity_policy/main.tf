resource "aws_ses_identity_policy" "ses_identity_policies" {
  for_each = var.ses_identity_policies

  identity = each.value.identity
  name     = each.value.name
  policy   = each.value.policy
  region   = each.value.region
}
