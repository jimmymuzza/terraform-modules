resource "azurerm_container_registry_task" "container_registry_tasks" {
  for_each = var.container_registry_tasks

  container_registry_id = each.value.container_registry_id
  name                  = each.value.name
  agent_pool_name       = each.value.agent_pool_name
  enabled               = each.value.enabled
  is_system_task        = each.value.is_system_task
  log_template          = each.value.log_template
  tags                  = each.value.tags
  timeout_in_seconds    = each.value.timeout_in_seconds

  dynamic "agent_setting" {
    for_each = each.value.agent_setting != null ? each.value.agent_setting : []
    content {
      cpu = agent_setting.value.cpu
    }
  }

  dynamic "base_image_trigger" {
    for_each = each.value.base_image_trigger != null ? each.value.base_image_trigger : []
    content {
      name                        = base_image_trigger.value.name
      type                        = base_image_trigger.value.type
      enabled                     = base_image_trigger.value.enabled
      update_trigger_endpoint     = base_image_trigger.value.update_trigger_endpoint
      update_trigger_payload_type = base_image_trigger.value.update_trigger_payload_type
    }
  }

  dynamic "docker_step" {
    for_each = each.value.docker_step != null ? each.value.docker_step : []
    content {
      context_access_token = docker_step.value.context_access_token
      context_path         = docker_step.value.context_path
      dockerfile_path      = docker_step.value.dockerfile_path
      arguments            = docker_step.value.arguments
      cache_enabled        = docker_step.value.cache_enabled
      image_names          = docker_step.value.image_names
      push_enabled         = docker_step.value.push_enabled
      secret_arguments     = docker_step.value.secret_arguments
      target               = docker_step.value.target
    }
  }

  dynamic "encoded_step" {
    for_each = each.value.encoded_step != null ? each.value.encoded_step : []
    content {
      task_content         = encoded_step.value.task_content
      context_access_token = encoded_step.value.context_access_token
      context_path         = encoded_step.value.context_path
      secret_values        = encoded_step.value.secret_values
      value_content        = encoded_step.value.value_content
      values               = encoded_step.value.values
    }
  }

  dynamic "file_step" {
    for_each = each.value.file_step != null ? each.value.file_step : []
    content {
      task_file_path       = file_step.value.task_file_path
      context_access_token = file_step.value.context_access_token
      context_path         = file_step.value.context_path
      secret_values        = file_step.value.secret_values
      value_file_path      = file_step.value.value_file_path
      values               = file_step.value.values
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "platform" {
    for_each = each.value.platform != null ? each.value.platform : []
    content {
      os           = platform.value.os
      architecture = platform.value.architecture
      variant      = platform.value.variant
    }
  }

  dynamic "registry_credential" {
    for_each = each.value.registry_credential != null ? each.value.registry_credential : []
    content {

      dynamic "custom" {
        for_each = registry_credential.value.custom != null ? registry_credential.value.custom : []
        content {
          login_server = custom.value.login_server
          identity     = custom.value.identity
          password     = custom.value.password
          username     = custom.value.username
        }
      }

      dynamic "source" {
        for_each = registry_credential.value.source != null ? registry_credential.value.source : []
        content {
          login_mode = source.value.login_mode
        }
      }
    }
  }

  dynamic "source_trigger" {
    for_each = each.value.source_trigger != null ? each.value.source_trigger : []
    content {
      events         = source_trigger.value.events
      name           = source_trigger.value.name
      repository_url = source_trigger.value.repository_url
      source_type    = source_trigger.value.source_type
      branch         = source_trigger.value.branch
      enabled        = source_trigger.value.enabled

      dynamic "authentication" {
        for_each = source_trigger.value.authentication != null ? source_trigger.value.authentication : []
        content {
          token             = authentication.value.token
          token_type        = authentication.value.token_type
          expire_in_seconds = authentication.value.expire_in_seconds
          refresh_token     = authentication.value.refresh_token
          scope             = authentication.value.scope
        }
      }
    }
  }

  dynamic "timer_trigger" {
    for_each = each.value.timer_trigger != null ? each.value.timer_trigger : []
    content {
      name     = timer_trigger.value.name
      schedule = timer_trigger.value.schedule
      enabled  = timer_trigger.value.enabled
    }
  }
}
