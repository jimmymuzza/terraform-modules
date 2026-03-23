resource "aws_bedrockagentcore_browser" "bedrockagentcore_browsers" {
  for_each = var.bedrockagentcore_browsers

  name               = each.value.name
  description        = each.value.description
  execution_role_arn = each.value.execution_role_arn
  region             = each.value.region
  tags               = each.value.tags

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
