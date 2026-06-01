resource "aws_ebs_snapshot_block_public_access" "ebs_snapshot_block_public_accesses" {
  for_each = var.ebs_snapshot_block_public_accesses

  state  = each.value.state
  region = each.value.region
}
