resource "aws_fsx_openzfs_snapshot" "fsx_openzfs_snapshots" {
  for_each = var.fsx_openzfs_snapshots

  name      = each.value.name
  volume_id = each.value.volume_id
  region    = each.value.region
  tags      = each.value.tags
  tags_all  = each.value.tags_all
}
