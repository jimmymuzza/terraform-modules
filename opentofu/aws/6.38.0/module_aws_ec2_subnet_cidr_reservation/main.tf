resource "aws_ec2_subnet_cidr_reservation" "ec2_subnet_cidr_reservations" {
  for_each = var.ec2_subnet_cidr_reservations

  cidr_block       = each.value.cidr_block
  reservation_type = each.value.reservation_type
  subnet_id        = each.value.subnet_id
  description      = each.value.description
  region           = each.value.region
}
