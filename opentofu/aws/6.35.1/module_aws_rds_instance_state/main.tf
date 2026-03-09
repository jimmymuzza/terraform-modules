resource "aws_rds_instance_state" "rds_instance_states" {
  for_each = var.rds_instance_states

  identifier = each.value.identifier
  state      = each.value.state
  region     = each.value.region
}
