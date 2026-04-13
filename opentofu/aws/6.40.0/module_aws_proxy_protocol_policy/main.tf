resource "aws_proxy_protocol_policy" "proxy_protocol_policies" {
  for_each = var.proxy_protocol_policies

  instance_ports = each.value.instance_ports
  load_balancer  = each.value.load_balancer
  region         = each.value.region
}
