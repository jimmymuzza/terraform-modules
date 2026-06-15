resource "aws_dx_connection_confirmation" "dx_connection_confirmations" {
  for_each = var.dx_connection_confirmations

  connection_id = each.value.connection_id
  region        = each.value.region
}
