resource "aws_ebs_volume_copy" "ebs_volume_copies" {
  for_each = var.ebs_volume_copies

  source_volume_id = each.value.source_volume_id
  iops             = each.value.iops
  region           = each.value.region
  size             = each.value.size
  tags             = each.value.tags
  throughput       = each.value.throughput
  volume_type      = each.value.volume_type
}
