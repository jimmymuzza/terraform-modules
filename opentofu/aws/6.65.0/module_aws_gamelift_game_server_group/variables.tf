variable "gamelift_game_server_groups" {
  description = <<EOT
Map of gamelift_game_server_groups, attributes below
Required:
    - game_server_group_name
    - max_size
    - min_size
    - role_arn
    - instance_definition
    - launch_template
Optional:
    - balancing_strategy
    - game_server_protection_policy
    - region
    - tags
    - tags_all
    - vpc_subnets
    - auto_scaling_policy
EOT

  type = map(object({
    game_server_group_name        = string
    max_size                      = number
    min_size                      = number
    role_arn                      = string
    balancing_strategy            = optional(string)
    game_server_protection_policy = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    vpc_subnets                   = optional(set(string))
    auto_scaling_policy           = optional(list(object({
            estimated_instance_warmup     = optional(number)
            target_tracking_configuration = list(object({
                target_value = number
            }))
        })))
    instance_definition           = set(object({
            instance_type     = string
            weighted_capacity = optional(string)
        }))
    launch_template               = list(object({
            name    = optional(string)
            version = optional(string)
        }))
  }))
}
