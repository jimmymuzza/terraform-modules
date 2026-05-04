resource "aws_securityhub_account_v2" "securityhub_account_v2s" {
  for_each = var.securityhub_account_v2s

  region = each.value.region
  tags   = each.value.tags
}
