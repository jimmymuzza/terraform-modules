resource "aws_route53_cidr_collection" "route53_cidr_collections" {
  for_each = var.route53_cidr_collections

  name = each.value.name
}
