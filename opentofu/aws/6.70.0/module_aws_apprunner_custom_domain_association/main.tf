resource "aws_apprunner_custom_domain_association" "apprunner_custom_domain_associations" {
  for_each = var.apprunner_custom_domain_associations

  domain_name          = each.value.domain_name
  service_arn          = each.value.service_arn
  enable_www_subdomain = each.value.enable_www_subdomain
  region               = each.value.region
}
