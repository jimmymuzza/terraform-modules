resource "aws_sesv2_email_identity_feedback_attributes" "sesv2_email_identity_feedback_attributes" {
  for_each = var.sesv2_email_identity_feedback_attributes

  email_identity           = each.value.email_identity
  email_forwarding_enabled = each.value.email_forwarding_enabled
  region                   = each.value.region
}
