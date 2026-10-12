resource "aws_ses_receipt_filter" "ses_receipt_filters" {
  for_each = var.ses_receipt_filters

  cidr   = each.value.cidr
  name   = each.value.name
  policy = each.value.policy
  region = each.value.region
}
