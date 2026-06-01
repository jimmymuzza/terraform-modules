resource "aws_dx_connection_association" "dx_connection_associations" {
  for_each = var.dx_connection_associations

  connection_id = each.value.connection_id
  lag_id        = each.value.lag_id
  region        = each.value.region
}
