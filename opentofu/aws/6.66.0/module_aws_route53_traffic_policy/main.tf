resource "aws_route53_traffic_policy" "route53_traffic_policies" {
  for_each = var.route53_traffic_policies

  document = each.value.document
  name     = each.value.name
  comment  = each.value.comment
}
