resource "aws_route53_zone_association" "route53_zone_associations" {
  for_each = var.route53_zone_associations

  vpc_id     = each.value.vpc_id
  zone_id    = each.value.zone_id
  vpc_region = each.value.vpc_region
}
