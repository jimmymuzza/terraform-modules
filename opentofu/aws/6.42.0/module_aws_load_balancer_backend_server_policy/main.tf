resource "aws_load_balancer_backend_server_policy" "load_balancer_backend_server_policies" {
  for_each = var.load_balancer_backend_server_policies

  instance_port      = each.value.instance_port
  load_balancer_name = each.value.load_balancer_name
  policy_names       = each.value.policy_names
  region             = each.value.region
}
