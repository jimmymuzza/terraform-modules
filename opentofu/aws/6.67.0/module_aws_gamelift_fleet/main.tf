resource "aws_gamelift_fleet" "gamelift_fleets" {
  for_each = var.gamelift_fleets

  ec2_instance_type                  = each.value.ec2_instance_type
  name                               = each.value.name
  build_id                           = each.value.build_id
  description                        = each.value.description
  fleet_type                         = each.value.fleet_type
  instance_role_arn                  = each.value.instance_role_arn
  metric_groups                      = each.value.metric_groups
  new_game_session_protection_policy = each.value.new_game_session_protection_policy
  region                             = each.value.region
  script_id                          = each.value.script_id
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all

  dynamic "certificate_configuration" {
    for_each = each.value.certificate_configuration != null ? each.value.certificate_configuration : []
    content {
      certificate_type = certificate_configuration.value.certificate_type
    }
  }

  dynamic "ec2_inbound_permission" {
    for_each = each.value.ec2_inbound_permission != null ? each.value.ec2_inbound_permission : []
    content {
      from_port = ec2_inbound_permission.value.from_port
      ip_range  = ec2_inbound_permission.value.ip_range
      protocol  = ec2_inbound_permission.value.protocol
      to_port   = ec2_inbound_permission.value.to_port
    }
  }

  dynamic "resource_creation_limit_policy" {
    for_each = each.value.resource_creation_limit_policy != null ? each.value.resource_creation_limit_policy : []
    content {
      new_game_sessions_per_creator = resource_creation_limit_policy.value.new_game_sessions_per_creator
      policy_period_in_minutes      = resource_creation_limit_policy.value.policy_period_in_minutes
    }
  }

  dynamic "runtime_configuration" {
    for_each = each.value.runtime_configuration != null ? each.value.runtime_configuration : []
    content {
      game_session_activation_timeout_seconds = runtime_configuration.value.game_session_activation_timeout_seconds
      max_concurrent_game_session_activations = runtime_configuration.value.max_concurrent_game_session_activations

      dynamic "server_process" {
        for_each = runtime_configuration.value.server_process != null ? runtime_configuration.value.server_process : []
        content {
          concurrent_executions = server_process.value.concurrent_executions
          launch_path           = server_process.value.launch_path
          parameters            = server_process.value.parameters
        }
      }
    }
  }
}
