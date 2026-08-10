resource "aws_load_balancer_policy" "load_balancer_policies" {
  for_each = var.load_balancer_policies

  load_balancer_name = each.value.load_balancer_name
  policy_name        = each.value.policy_name
  policy_type_name   = each.value.policy_type_name
  region             = each.value.region

  dynamic "policy_attribute" {
    for_each = each.value.policy_attribute != null ? each.value.policy_attribute : []
    content {
      name  = policy_attribute.value.name
      value = policy_attribute.value.value
    }
  }
}
