resource "aws_load_balancer_listener_policy" "load_balancer_listener_policies" {
  for_each = var.load_balancer_listener_policies

  load_balancer_name = each.value.load_balancer_name
  load_balancer_port = each.value.load_balancer_port
  policy_names       = each.value.policy_names
  region             = each.value.region
  triggers           = each.value.triggers
}
