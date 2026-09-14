resource "aws_ec2_instance_state" "ec2_instance_states" {
  for_each = var.ec2_instance_states

  instance_id = each.value.instance_id
  state       = each.value.state
  force       = each.value.force
  region      = each.value.region
}
