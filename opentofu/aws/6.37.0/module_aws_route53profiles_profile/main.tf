resource "aws_route53profiles_profile" "route53profiles_profiles" {
  for_each = var.route53profiles_profiles

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags
}
