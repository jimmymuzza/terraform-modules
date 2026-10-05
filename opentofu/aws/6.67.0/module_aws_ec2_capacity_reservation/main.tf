resource "aws_ec2_capacity_reservation" "ec2_capacity_reservations" {
  for_each = var.ec2_capacity_reservations

  availability_zone       = each.value.availability_zone
  instance_count          = each.value.instance_count
  instance_platform       = each.value.instance_platform
  instance_type           = each.value.instance_type
  ebs_optimized           = each.value.ebs_optimized
  end_date                = each.value.end_date
  end_date_type           = each.value.end_date_type
  ephemeral_storage       = each.value.ephemeral_storage
  instance_match_criteria = each.value.instance_match_criteria
  outpost_arn             = each.value.outpost_arn
  placement_group_arn     = each.value.placement_group_arn
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
  tenancy                 = each.value.tenancy
}
