resource "aws_ec2_capacity_block_reservation" "ec2_capacity_block_reservations" {
  for_each = var.ec2_capacity_block_reservations

  capacity_block_offering_id = each.value.capacity_block_offering_id
  instance_platform          = each.value.instance_platform
  region                     = each.value.region
  tags                       = each.value.tags
}
