resource "aws_amplify_domain_association" "amplify_domain_associations" {
  for_each = var.amplify_domain_associations

  app_id                 = each.value.app_id
  domain_name            = each.value.domain_name
  enable_auto_sub_domain = each.value.enable_auto_sub_domain
  region                 = each.value.region
  wait_for_verification  = each.value.wait_for_verification

  dynamic "certificate_settings" {
    for_each = each.value.certificate_settings != null ? each.value.certificate_settings : []
    content {
      type                   = certificate_settings.value.type
      custom_certificate_arn = certificate_settings.value.custom_certificate_arn
    }
  }

  dynamic "sub_domain" {
    for_each = each.value.sub_domain != null ? each.value.sub_domain : []
    content {
      branch_name = sub_domain.value.branch_name
      prefix      = sub_domain.value.prefix
    }
  }
}
