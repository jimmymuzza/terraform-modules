resource "aws_route53_cidr_location" "route53_cidr_locations" {
  for_each = var.route53_cidr_locations

  cidr_blocks        = each.value.cidr_blocks
  cidr_collection_id = each.value.cidr_collection_id
  name               = each.value.name
}
