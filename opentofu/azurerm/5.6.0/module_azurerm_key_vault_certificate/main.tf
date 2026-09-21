resource "azurerm_key_vault_certificate" "key_vault_certificates" {
  for_each = var.key_vault_certificates

  key_vault_id = each.value.key_vault_id
  name         = each.value.name
  tags         = each.value.tags

  dynamic "certificate" {
    for_each = each.value.certificate != null ? each.value.certificate : []
    content {
      contents = certificate.value.contents
      password = certificate.value.password
    }
  }

  dynamic "certificate_policy" {
    for_each = each.value.certificate_policy != null ? each.value.certificate_policy : []
    content {

      dynamic "issuer_parameters" {
        for_each = certificate_policy.value.issuer_parameters != null ? certificate_policy.value.issuer_parameters : []
        content {
          name = issuer_parameters.value.name
        }
      }

      dynamic "key_properties" {
        for_each = certificate_policy.value.key_properties != null ? certificate_policy.value.key_properties : []
        content {
          exportable = key_properties.value.exportable
          key_type   = key_properties.value.key_type
          reuse_key  = key_properties.value.reuse_key
          curve      = key_properties.value.curve
          key_size   = key_properties.value.key_size
        }
      }

      dynamic "lifetime_action" {
        for_each = certificate_policy.value.lifetime_action != null ? certificate_policy.value.lifetime_action : []
        content {

          dynamic "action" {
            for_each = lifetime_action.value.action != null ? lifetime_action.value.action : []
            content {
              action_type = action.value.action_type
            }
          }

          dynamic "trigger" {
            for_each = lifetime_action.value.trigger != null ? lifetime_action.value.trigger : []
            content {
              days_before_expiry  = trigger.value.days_before_expiry
              lifetime_percentage = trigger.value.lifetime_percentage
            }
          }
        }
      }

      dynamic "secret_properties" {
        for_each = certificate_policy.value.secret_properties != null ? certificate_policy.value.secret_properties : []
        content {
          content_type = secret_properties.value.content_type
        }
      }

      dynamic "x509_certificate_properties" {
        for_each = certificate_policy.value.x509_certificate_properties != null ? certificate_policy.value.x509_certificate_properties : []
        content {
          key_usage          = x509_certificate_properties.value.key_usage
          subject            = x509_certificate_properties.value.subject
          validity_in_months = x509_certificate_properties.value.validity_in_months
          extended_key_usage = x509_certificate_properties.value.extended_key_usage

          dynamic "subject_alternative_names" {
            for_each = x509_certificate_properties.value.subject_alternative_names != null ? x509_certificate_properties.value.subject_alternative_names : []
            content {
              dns_names = subject_alternative_names.value.dns_names
              emails    = subject_alternative_names.value.emails
              upns      = subject_alternative_names.value.upns
            }
          }
        }
      }
    }
  }
}
