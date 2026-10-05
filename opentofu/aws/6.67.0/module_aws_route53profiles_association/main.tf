resource "aws_route53profiles_association" "route53profiles_associations" {
  for_each = var.route53profiles_associations

  name        = each.value.name
  profile_id  = each.value.profile_id
  resource_id = each.value.resource_id
  region      = each.value.region
  tags        = each.value.tags
}
