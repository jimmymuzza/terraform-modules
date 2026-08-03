resource "aws_detective_invitation_accepter" "detective_invitation_accepters" {
  for_each = var.detective_invitation_accepters

  graph_arn = each.value.graph_arn
  region    = each.value.region
}
