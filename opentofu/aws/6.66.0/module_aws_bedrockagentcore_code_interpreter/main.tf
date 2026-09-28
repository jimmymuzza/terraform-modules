resource "aws_bedrockagentcore_code_interpreter" "bedrockagentcore_code_interpreters" {
  for_each = var.bedrockagentcore_code_interpreters

  name               = each.value.name
  description        = each.value.description
  execution_role_arn = each.value.execution_role_arn
  region             = each.value.region
  tags               = each.value.tags

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
}
