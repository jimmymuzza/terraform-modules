resource "aws_route53_hosted_zone_dnssec" "route53_hosted_zone_dnssecs" {
  for_each = var.route53_hosted_zone_dnssecs

  hosted_zone_id = each.value.hosted_zone_id
  signing_status = each.value.signing_status
}
