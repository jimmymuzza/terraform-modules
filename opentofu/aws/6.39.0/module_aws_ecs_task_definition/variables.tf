variable "ecs_task_definitions" {
  description = <<EOT
Map of ecs_task_definitions, attributes below
Required:
    - container_definitions
    - family
Optional:
    - cpu
    - enable_fault_injection
    - execution_role_arn
    - ipc_mode
    - memory
    - network_mode
    - pid_mode
    - region
    - requires_compatibilities
    - skip_destroy
    - tags
    - tags_all
    - task_role_arn
    - track_latest
    - ephemeral_storage
    - placement_constraints
    - proxy_configuration
    - runtime_platform
    - volume
EOT

  type = map(object({
    container_definitions    = string
    family                   = string
    cpu                      = optional(string)
    enable_fault_injection   = optional(bool)
    execution_role_arn       = optional(string)
    ipc_mode                 = optional(string)
    memory                   = optional(string)
    network_mode             = optional(string)
    pid_mode                 = optional(string)
    region                   = optional(string)
    requires_compatibilities = optional(set(string))
    skip_destroy             = optional(bool)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    task_role_arn            = optional(string)
    track_latest             = optional(bool)
    ephemeral_storage        = optional(list(object({
            size_in_gib = number
        })))
    placement_constraints    = optional(set(object({
            type       = string
            expression = optional(string)
        })))
    proxy_configuration      = optional(list(object({
            container_name = string
            properties     = optional(map(string))
            type           = optional(string)
        })))
    runtime_platform         = optional(list(object({
            cpu_architecture        = optional(string)
            operating_system_family = optional(string)
        })))
    volume                   = optional(set(object({
            name                                         = string
            configure_at_launch                          = optional(bool)
            host_path                                    = optional(string)
            docker_volume_configuration                  = optional(list(object({
                autoprovision = optional(bool)
                driver        = optional(string)
                driver_opts   = optional(map(string))
                labels        = optional(map(string))
                scope         = optional(string)
            })))
            efs_volume_configuration                     = optional(list(object({
                file_system_id          = string
                root_directory          = optional(string)
                transit_encryption      = optional(string)
                transit_encryption_port = optional(number)
                authorization_config    = optional(list(object({
                    access_point_id = optional(string)
                    iam             = optional(string)
                })))
            })))
            fsx_windows_file_server_volume_configuration = optional(list(object({
                file_system_id       = string
                root_directory       = string
                authorization_config = list(object({
                    credentials_parameter = string
                    domain                = string
                }))
            })))
        })))
  }))
}
