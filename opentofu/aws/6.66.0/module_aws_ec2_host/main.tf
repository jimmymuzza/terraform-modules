resource "aws_ec2_host" "ec2_hosts" {
  for_each = var.ec2_hosts

  availability_zone = each.value.availability_zone
  asset_id          = each.value.asset_id
  auto_placement    = each.value.auto_placement
  host_recovery     = each.value.host_recovery
  instance_family   = each.value.instance_family
  instance_type     = each.value.instance_type
  outpost_arn       = each.value.outpost_arn
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
