resource "aws_macie2_account" "macie2_accounts" {
  for_each = var.macie2_accounts

  finding_publishing_frequency = each.value.finding_publishing_frequency
  region                       = each.value.region
  status                       = each.value.status
}
