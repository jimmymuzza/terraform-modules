variable "container_registry_tasks" {
  description = <<EOT
Map of container_registry_tasks, attributes below
Required:
    - container_registry_id
    - name
Optional:
    - agent_pool_name
    - enabled
    - is_system_task
    - log_template
    - tags
    - timeout_in_seconds
    - agent_setting
    - base_image_trigger
    - docker_step
    - encoded_step
    - file_step
    - identity
    - platform
    - registry_credential
    - source_trigger
    - timer_trigger
EOT

  type = map(object({
    container_registry_id = string
    name                  = string
    agent_pool_name       = optional(string)
    enabled               = optional(bool)
    is_system_task        = optional(bool)
    log_template          = optional(string)
    tags                  = optional(map(string))
    timeout_in_seconds    = optional(number)
    agent_setting         = optional(list(object({
            cpu = number
        })))
    base_image_trigger    = optional(list(object({
            name                        = string
            type                        = string
            enabled                     = optional(bool)
            update_trigger_endpoint     = optional(string)
            update_trigger_payload_type = optional(string)
        })))
    docker_step           = optional(list(object({
            context_access_token = string
            context_path         = string
            dockerfile_path      = string
            arguments            = optional(map(string))
            cache_enabled        = optional(bool)
            image_names          = optional(list(string))
            push_enabled         = optional(bool)
            secret_arguments     = optional(map(string))
            target               = optional(string)
        })))
    encoded_step          = optional(list(object({
            task_content         = string
            context_access_token = optional(string)
            context_path         = optional(string)
            secret_values        = optional(map(string))
            value_content        = optional(string)
            values               = optional(map(string))
        })))
    file_step             = optional(list(object({
            task_file_path       = string
            context_access_token = optional(string)
            context_path         = optional(string)
            secret_values        = optional(map(string))
            value_file_path      = optional(string)
            values               = optional(map(string))
        })))
    identity              = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    platform              = optional(list(object({
            os           = string
            architecture = optional(string)
            variant      = optional(string)
        })))
    registry_credential   = optional(list(object({
            custom = optional(set(object({
                login_server = string
                identity     = optional(string)
                password     = optional(string)
                username     = optional(string)
            })))
            source = optional(list(object({
                login_mode = string
            })))
        })))
    source_trigger        = optional(list(object({
            events         = list(string)
            name           = string
            repository_url = string
            source_type    = string
            branch         = optional(string)
            enabled        = optional(bool)
            authentication = optional(list(object({
                token             = string
                token_type        = string
                expire_in_seconds = optional(number)
                refresh_token     = optional(string)
                scope             = optional(string)
            })))
        })))
    timer_trigger         = optional(list(object({
            name     = string
            schedule = string
            enabled  = optional(bool)
        })))
  }))
}
