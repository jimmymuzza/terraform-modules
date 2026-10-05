resource "aws_ses_receipt_rule_set" "ses_receipt_rule_sets" {
  for_each = var.ses_receipt_rule_sets

  rule_set_name = each.value.rule_set_name
  region        = each.value.region
}
