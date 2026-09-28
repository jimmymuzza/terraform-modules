resource "aws_appsync_domain_name" "appsync_domain_names" {
  for_each = var.appsync_domain_names

  certificate_arn = each.value.certificate_arn
  domain_name     = each.value.domain_name
  description     = each.value.description
  region          = each.value.region
}
