resource "aws_bedrockagentcore_browser" "bedrockagentcore_browsers" {
  for_each = var.bedrockagentcore_browsers

  name               = each.value.name
  description        = each.value.description
  execution_role_arn = each.value.execution_role_arn
  region             = each.value.region
  tags               = each.value.tags

  dynamic "browser_signing" {
    for_each = each.value.browser_signing != null ? each.value.browser_signing : []
    content {
      enabled = browser_signing.value.enabled
    }
  }

  dynamic "certificate" {
    for_each = each.value.certificate != null ? each.value.certificate : []
    content {

      dynamic "location" {
        for_each = certificate.value.location != null ? certificate.value.location : []
        content {

          dynamic "secrets_manager" {
            for_each = location.value.secrets_manager != null ? location.value.secrets_manager : []
            content {
              secret_arn = secrets_manager.value.secret_arn
            }
          }
        }
      }
    }
  }

  dynamic "enterprise_policy" {
    for_each = each.value.enterprise_policy != null ? each.value.enterprise_policy : []
    content {
      type = enterprise_policy.value.type

      dynamic "location" {
        for_each = enterprise_policy.value.location != null ? enterprise_policy.value.location : []
        content {

          dynamic "s3" {
            for_each = location.value.s3 != null ? location.value.s3 : []
            content {
              bucket     = s3.value.bucket
              prefix     = s3.value.prefix
              version_id = s3.value.version_id
            }
          }
        }
      }
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {
      network_mode = network_configuration.value.network_mode

      dynamic "vpc_config" {
        for_each = network_configuration.value.vpc_config != null ? network_configuration.value.vpc_config : []
        content {
          security_groups = vpc_config.value.security_groups
          subnets         = vpc_config.value.subnets
        }
      }
    }
  }

  dynamic "recording" {
    for_each = each.value.recording != null ? each.value.recording : []
    content {
      enabled = recording.value.enabled

      dynamic "s3_location" {
        for_each = recording.value.s3_location != null ? recording.value.s3_location : []
        content {
          bucket = s3_location.value.bucket
          prefix = s3_location.value.prefix
        }
      }
    }
  }
}
