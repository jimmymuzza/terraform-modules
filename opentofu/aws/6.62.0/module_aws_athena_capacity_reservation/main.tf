resource "aws_athena_capacity_reservation" "athena_capacity_reservations" {
  for_each = var.athena_capacity_reservations

  name        = each.value.name
  target_dpus = each.value.target_dpus
  region      = each.value.region
  tags        = each.value.tags
}
