variable "batch_job_definitions" {
  description = <<EOT
Map of batch_job_definitions, attributes below
Required:
    - name
    - type
Optional:
    - container_properties
    - deregister_on_new_revision
    - ecs_properties
    - node_properties
    - parameters
    - platform_capabilities
    - propagate_tags
    - region
    - scheduling_priority
    - tags
    - tags_all
    - eks_properties
    - retry_strategy
    - timeout
EOT

  type = map(object({
    name                       = string
    type                       = string
    container_properties       = optional(string)
    deregister_on_new_revision = optional(bool)
    ecs_properties             = optional(string)
    node_properties            = optional(string)
    parameters                 = optional(map(string))
    platform_capabilities      = optional(set(string))
    propagate_tags             = optional(bool)
    region                     = optional(string)
    scheduling_priority        = optional(number)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    eks_properties             = optional(list(object({
            pod_properties = list(object({
                dns_policy              = optional(string)
                host_network            = optional(bool)
                service_account_name    = optional(string)
                share_process_namespace = optional(bool)
                containers              = list(object({
                    image             = string
                    args              = optional(list(string))
                    command           = optional(list(string))
                    image_pull_policy = optional(string)
                    name              = optional(string)
                    env               = optional(set(object({
                        name  = string
                        value = string
                    })))
                    resources         = optional(list(object({
                        limits   = optional(map(string))
                        requests = optional(map(string))
                    })))
                    security_context  = optional(list(object({
                        allow_privilege_escalation = optional(bool)
                        privileged                 = optional(bool)
                        read_only_root_file_system = optional(bool)
                        run_as_group               = optional(number)
                        run_as_non_root            = optional(bool)
                        run_as_user                = optional(number)
                    })))
                    volume_mounts     = optional(list(object({
                        mount_path = string
                        name       = string
                        read_only  = optional(bool)
                    })))
                }))
                image_pull_secret       = optional(list(object({
                    name = string
                })))
                init_containers         = optional(list(object({
                    image             = string
                    args              = optional(list(string))
                    command           = optional(list(string))
                    image_pull_policy = optional(string)
                    name              = optional(string)
                    env               = optional(set(object({
                        name  = string
                        value = string
                    })))
                    resources         = optional(list(object({
                        limits   = optional(map(string))
                        requests = optional(map(string))
                    })))
                    security_context  = optional(list(object({
                        allow_privilege_escalation = optional(bool)
                        privileged                 = optional(bool)
                        read_only_root_file_system = optional(bool)
                        run_as_group               = optional(number)
                        run_as_non_root            = optional(bool)
                        run_as_user                = optional(number)
                    })))
                    volume_mounts     = optional(list(object({
                        mount_path = string
                        name       = string
                        read_only  = optional(bool)
                    })))
                })))
                metadata                = optional(list(object({
                    labels = optional(map(string))
                })))
                volumes                 = optional(list(object({
                    name      = optional(string)
                    empty_dir = optional(list(object({
                        size_limit = string
                        medium     = optional(string)
                    })))
                    host_path = optional(list(object({
                        path = string
                    })))
                    secret    = optional(list(object({
                        secret_name = string
                        optional    = optional(bool)
                    })))
                })))
            }))
        })))
    retry_strategy             = optional(list(object({
            attempts         = optional(number)
            evaluate_on_exit = optional(list(object({
                action           = string
                on_exit_code     = optional(string)
                on_reason        = optional(string)
                on_status_reason = optional(string)
            })))
        })))
    timeout                    = optional(list(object({
            attempt_duration_seconds = optional(number)
        })))
  }))
}
