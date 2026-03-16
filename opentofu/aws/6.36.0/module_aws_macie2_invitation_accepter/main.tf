resource "aws_macie2_invitation_accepter" "macie2_invitation_accepters" {
  for_each = var.macie2_invitation_accepters

  administrator_account_id = each.value.administrator_account_id
  region                   = each.value.region
}
