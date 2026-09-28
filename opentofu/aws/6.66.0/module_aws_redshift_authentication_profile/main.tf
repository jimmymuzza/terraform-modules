resource "aws_redshift_authentication_profile" "redshift_authentication_profiles" {
  for_each = var.redshift_authentication_profiles

  authentication_profile_content = each.value.authentication_profile_content
  authentication_profile_name    = each.value.authentication_profile_name
  region                         = each.value.region
}
