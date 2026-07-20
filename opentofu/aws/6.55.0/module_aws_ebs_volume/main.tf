resource "aws_ebs_volume" "ebs_volumes" {
  for_each = var.ebs_volumes

  availability_zone          = each.value.availability_zone
  encrypted                  = each.value.encrypted
  final_snapshot             = each.value.final_snapshot
  iops                       = each.value.iops
  kms_key_id                 = each.value.kms_key_id
  multi_attach_enabled       = each.value.multi_attach_enabled
  outpost_arn                = each.value.outpost_arn
  region                     = each.value.region
  size                       = each.value.size
  snapshot_id                = each.value.snapshot_id
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  throughput                 = each.value.throughput
  type                       = each.value.type
  volume_initialization_rate = each.value.volume_initialization_rate
}
