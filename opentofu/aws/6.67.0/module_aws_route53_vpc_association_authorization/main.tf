resource "aws_route53_vpc_association_authorization" "route53_vpc_association_authorizations" {
  for_each = var.route53_vpc_association_authorizations

  vpc_id     = each.value.vpc_id
  zone_id    = each.value.zone_id
  vpc_region = each.value.vpc_region
}
