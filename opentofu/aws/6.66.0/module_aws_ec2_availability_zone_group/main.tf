resource "aws_ec2_availability_zone_group" "ec2_availability_zone_groups" {
  for_each = var.ec2_availability_zone_groups

  group_name    = each.value.group_name
  opt_in_status = each.value.opt_in_status
  region        = each.value.region
}
