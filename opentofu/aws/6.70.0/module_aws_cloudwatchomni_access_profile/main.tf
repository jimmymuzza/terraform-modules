resource "aws_cloudwatchomni_access_profile" "cloudwatchomni_access_profiles" {
  for_each = var.cloudwatchomni_access_profiles

  name        = each.value.name
  space_id    = each.value.space_id
  description = each.value.description
  region      = each.value.region
}
