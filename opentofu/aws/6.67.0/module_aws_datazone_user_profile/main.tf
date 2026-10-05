resource "aws_datazone_user_profile" "datazone_user_profiles" {
  for_each = var.datazone_user_profiles

  domain_identifier = each.value.domain_identifier
  user_identifier   = each.value.user_identifier
  region            = each.value.region
  status            = each.value.status
  user_type         = each.value.user_type
}
