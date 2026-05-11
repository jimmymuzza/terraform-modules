resource "aws_route53_delegation_set" "route53_delegation_sets" {
  for_each = var.route53_delegation_sets

  reference_name = each.value.reference_name
}
