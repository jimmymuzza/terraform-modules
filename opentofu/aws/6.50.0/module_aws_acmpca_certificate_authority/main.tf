resource "aws_acmpca_certificate_authority" "acmpca_certificate_authorities" {
  for_each = var.acmpca_certificate_authorities

  enabled                         = each.value.enabled
  key_storage_security_standard   = each.value.key_storage_security_standard
  permanent_deletion_time_in_days = each.value.permanent_deletion_time_in_days
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  type                            = each.value.type
  usage_mode                      = each.value.usage_mode

  dynamic "certificate_authority_configuration" {
    for_each = each.value.certificate_authority_configuration != null ? each.value.certificate_authority_configuration : []
    content {
      key_algorithm     = certificate_authority_configuration.value.key_algorithm
      signing_algorithm = certificate_authority_configuration.value.signing_algorithm

      dynamic "subject" {
        for_each = certificate_authority_configuration.value.subject != null ? certificate_authority_configuration.value.subject : []
        content {
          common_name                  = subject.value.common_name
          country                      = subject.value.country
          distinguished_name_qualifier = subject.value.distinguished_name_qualifier
          generation_qualifier         = subject.value.generation_qualifier
          given_name                   = subject.value.given_name
          initials                     = subject.value.initials
          locality                     = subject.value.locality
          organization                 = subject.value.organization
          organizational_unit          = subject.value.organizational_unit
          pseudonym                    = subject.value.pseudonym
          state                        = subject.value.state
          surname                      = subject.value.surname
          title                        = subject.value.title
        }
      }
    }
  }

  dynamic "revocation_configuration" {
    for_each = each.value.revocation_configuration != null ? each.value.revocation_configuration : []
    content {

      dynamic "crl_configuration" {
        for_each = revocation_configuration.value.crl_configuration != null ? revocation_configuration.value.crl_configuration : []
        content {
          custom_cname       = crl_configuration.value.custom_cname
          custom_path        = crl_configuration.value.custom_path
          enabled            = crl_configuration.value.enabled
          expiration_in_days = crl_configuration.value.expiration_in_days
          s3_bucket_name     = crl_configuration.value.s3_bucket_name
          s3_object_acl      = crl_configuration.value.s3_object_acl
        }
      }

      dynamic "ocsp_configuration" {
        for_each = revocation_configuration.value.ocsp_configuration != null ? revocation_configuration.value.ocsp_configuration : []
        content {
          enabled           = ocsp_configuration.value.enabled
          ocsp_custom_cname = ocsp_configuration.value.ocsp_custom_cname
        }
      }
    }
  }
}
