variable "ecs_task_sets" {
  description = <<EOT
Map of ecs_task_sets, attributes below
Required:
    - cluster
    - service
    - task_definition
Optional:
    - external_id
    - force_delete
    - launch_type
    - platform_version
    - region
    - tags
    - tags_all
    - wait_until_stable
    - wait_until_stable_timeout
    - capacity_provider_strategy
    - load_balancer
    - network_configuration
    - scale
    - service_registries
EOT

  type = map(object({
    cluster                    = string
    service                    = string
    task_definition            = string
    external_id                = optional(string)
    force_delete               = optional(bool)
    launch_type                = optional(string)
    platform_version           = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    wait_until_stable          = optional(bool)
    wait_until_stable_timeout  = optional(string)
    capacity_provider_strategy = optional(set(object({
            capacity_provider = string
            weight            = number
            base              = optional(number)
        })))
    load_balancer              = optional(set(object({
            container_name     = string
            container_port     = optional(number)
            load_balancer_name = optional(string)
            target_group_arn   = optional(string)
        })))
    network_configuration      = optional(list(object({
            subnets          = set(string)
            assign_public_ip = optional(bool)
            security_groups  = optional(set(string))
        })))
    scale                      = optional(list(object({
            unit  = optional(string)
            value = optional(number)
        })))
    service_registries         = optional(list(object({
            registry_arn   = string
            container_name = optional(string)
            container_port = optional(number)
            port           = optional(number)
        })))
  }))
}
