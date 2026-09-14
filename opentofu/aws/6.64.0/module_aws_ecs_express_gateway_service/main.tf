resource "aws_ecs_express_gateway_service" "ecs_express_gateway_services" {
  for_each = var.ecs_express_gateway_services

  execution_role_arn      = each.value.execution_role_arn
  infrastructure_role_arn = each.value.infrastructure_role_arn
  cluster                 = each.value.cluster
  cpu                     = each.value.cpu
  health_check_path       = each.value.health_check_path
  memory                  = each.value.memory
  network_configuration   = each.value.network_configuration
  region                  = each.value.region
  scaling_target          = each.value.scaling_target
  service_name            = each.value.service_name
  tags                    = each.value.tags
  task_role_arn           = each.value.task_role_arn
  wait_for_steady_state   = each.value.wait_for_steady_state

  dynamic "primary_container" {
    for_each = each.value.primary_container != null ? each.value.primary_container : []
    content {
      image                  = primary_container.value.image
      aws_logs_configuration = primary_container.value.aws_logs_configuration
      command                = primary_container.value.command
      container_port         = primary_container.value.container_port

      dynamic "environment" {
        for_each = primary_container.value.environment != null ? primary_container.value.environment : []
        content {
          name  = environment.value.name
          value = environment.value.value
        }
      }

      dynamic "repository_credentials" {
        for_each = primary_container.value.repository_credentials != null ? primary_container.value.repository_credentials : []
        content {
          credentials_parameter = repository_credentials.value.credentials_parameter
        }
      }

      dynamic "secret" {
        for_each = primary_container.value.secret != null ? primary_container.value.secret : []
        content {
          name       = secret.value.name
          value_from = secret.value.value_from
        }
      }
    }
  }
}
