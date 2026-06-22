resource "aws_securityhub_invite_accepter" "securityhub_invite_accepters" {
  for_each = var.securityhub_invite_accepters

  master_id = each.value.master_id
  region    = each.value.region
}
