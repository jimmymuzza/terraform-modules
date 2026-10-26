resource "aws_ram_resource_share_accepter" "ram_resource_share_accepters" {
  for_each = var.ram_resource_share_accepters

  share_arn = each.value.share_arn
  region    = each.value.region
}
