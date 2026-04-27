resource "aws_sesv2_account_suppression_attributes" "sesv2_account_suppression_attributes" {
  for_each = var.sesv2_account_suppression_attributes

  suppressed_reasons = each.value.suppressed_reasons
  region             = each.value.region
}
