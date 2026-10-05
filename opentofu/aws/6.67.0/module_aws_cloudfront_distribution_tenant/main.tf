resource "aws_cloudfront_distribution_tenant" "cloudfront_distribution_tenants" {
  for_each = var.cloudfront_distribution_tenants

  distribution_id     = each.value.distribution_id
  name                = each.value.name
  connection_group_id = each.value.connection_group_id
  enabled             = each.value.enabled
  tags                = each.value.tags
  wait_for_deployment = each.value.wait_for_deployment

  dynamic "customizations" {
    for_each = each.value.customizations != null ? each.value.customizations : []
    content {

      dynamic "certificate" {
        for_each = customizations.value.certificate != null ? customizations.value.certificate : []
        content {
          arn = certificate.value.arn
        }
      }

      dynamic "geo_restriction" {
        for_each = customizations.value.geo_restriction != null ? customizations.value.geo_restriction : []
        content {
          locations        = geo_restriction.value.locations
          restriction_type = geo_restriction.value.restriction_type
        }
      }

      dynamic "web_acl" {
        for_each = customizations.value.web_acl != null ? customizations.value.web_acl : []
        content {
          action = web_acl.value.action
          arn    = web_acl.value.arn
        }
      }
    }
  }

  dynamic "domain" {
    for_each = each.value.domain != null ? each.value.domain : []
    content {
      domain = domain.value.domain
    }
  }

  dynamic "managed_certificate_request" {
    for_each = each.value.managed_certificate_request != null ? each.value.managed_certificate_request : []
    content {
      certificate_transparency_logging_preference = managed_certificate_request.value.certificate_transparency_logging_preference
      primary_domain_name                         = managed_certificate_request.value.primary_domain_name
      validation_token_host                       = managed_certificate_request.value.validation_token_host
    }
  }

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
