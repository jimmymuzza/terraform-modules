resource "aws_route53profiles_resource_association" "route53profiles_resource_associations" {
  for_each = var.route53profiles_resource_associations

  name                = each.value.name
  profile_id          = each.value.profile_id
  resource_arn        = each.value.resource_arn
  region              = each.value.region
  resource_properties = each.value.resource_properties
}
