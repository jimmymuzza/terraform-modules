resource "aws_guardduty_invite_accepter" "guardduty_invite_accepters" {
  for_each = var.guardduty_invite_accepters

  detector_id       = each.value.detector_id
  master_account_id = each.value.master_account_id
  region            = each.value.region
}
