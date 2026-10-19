resource "aws_gamelift_game_server_group" "gamelift_game_server_groups" {
  for_each = var.gamelift_game_server_groups

  game_server_group_name        = each.value.game_server_group_name
  max_size                      = each.value.max_size
  min_size                      = each.value.min_size
  role_arn                      = each.value.role_arn
  balancing_strategy            = each.value.balancing_strategy
  game_server_protection_policy = each.value.game_server_protection_policy
  region                        = each.value.region
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  vpc_subnets                   = each.value.vpc_subnets

  dynamic "auto_scaling_policy" {
    for_each = each.value.auto_scaling_policy != null ? each.value.auto_scaling_policy : []
    content {
      estimated_instance_warmup = auto_scaling_policy.value.estimated_instance_warmup

      dynamic "target_tracking_configuration" {
        for_each = auto_scaling_policy.value.target_tracking_configuration != null ? auto_scaling_policy.value.target_tracking_configuration : []
        content {
          target_value = target_tracking_configuration.value.target_value
        }
      }
    }
  }

  dynamic "instance_definition" {
    for_each = each.value.instance_definition != null ? each.value.instance_definition : []
    content {
      instance_type     = instance_definition.value.instance_type
      weighted_capacity = instance_definition.value.weighted_capacity
    }
  }

  dynamic "launch_template" {
    for_each = each.value.launch_template != null ? each.value.launch_template : []
    content {
      name    = launch_template.value.name
      version = launch_template.value.version
    }
  }
}
