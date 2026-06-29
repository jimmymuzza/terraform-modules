resource "aws_acm_certificate" "acm_certificates" {
  for_each = var.acm_certificates

  certificate_authority_arn = each.value.certificate_authority_arn
  certificate_body          = each.value.certificate_body
  certificate_chain         = each.value.certificate_chain
  domain_name               = each.value.domain_name
  early_renewal_duration    = each.value.early_renewal_duration
  key_algorithm             = each.value.key_algorithm
  private_key               = each.value.private_key
  private_key_wo            = each.value.private_key_wo
  private_key_wo_version    = each.value.private_key_wo_version
  region                    = each.value.region
  subject_alternative_names = each.value.subject_alternative_names
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  validation_method         = each.value.validation_method

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      certificate_transparency_logging_preference = options.value.certificate_transparency_logging_preference
      export                                      = options.value.export
    }
  }

  dynamic "validation_option" {
    for_each = each.value.validation_option != null ? each.value.validation_option : []
    content {
      domain_name       = validation_option.value.domain_name
      validation_domain = validation_option.value.validation_domain
    }
  }
}
