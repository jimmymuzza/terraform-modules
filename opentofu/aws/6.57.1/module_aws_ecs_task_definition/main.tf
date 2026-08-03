resource "aws_ecs_task_definition" "ecs_task_definitions" {
  for_each = var.ecs_task_definitions

  container_definitions    = each.value.container_definitions
  family                   = each.value.family
  cpu                      = each.value.cpu
  enable_fault_injection   = each.value.enable_fault_injection
  execution_role_arn       = each.value.execution_role_arn
  ipc_mode                 = each.value.ipc_mode
  memory                   = each.value.memory
  network_mode             = each.value.network_mode
  pid_mode                 = each.value.pid_mode
  region                   = each.value.region
  requires_compatibilities = each.value.requires_compatibilities
  skip_destroy             = each.value.skip_destroy
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  task_role_arn            = each.value.task_role_arn
  track_latest             = each.value.track_latest

  dynamic "ephemeral_storage" {
    for_each = each.value.ephemeral_storage != null ? each.value.ephemeral_storage : []
    content {
      size_in_gib = ephemeral_storage.value.size_in_gib
    }
  }

  dynamic "placement_constraints" {
    for_each = each.value.placement_constraints != null ? each.value.placement_constraints : []
    content {
      type       = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  dynamic "proxy_configuration" {
    for_each = each.value.proxy_configuration != null ? each.value.proxy_configuration : []
    content {
      container_name = proxy_configuration.value.container_name
      properties     = proxy_configuration.value.properties
      type           = proxy_configuration.value.type
    }
  }

  dynamic "runtime_platform" {
    for_each = each.value.runtime_platform != null ? each.value.runtime_platform : []
    content {
      cpu_architecture        = runtime_platform.value.cpu_architecture
      operating_system_family = runtime_platform.value.operating_system_family
    }
  }

  dynamic "volume" {
    for_each = each.value.volume != null ? each.value.volume : []
    content {
      name                = volume.value.name
      configure_at_launch = volume.value.configure_at_launch
      host_path           = volume.value.host_path

      dynamic "docker_volume_configuration" {
        for_each = volume.value.docker_volume_configuration != null ? volume.value.docker_volume_configuration : []
        content {
          autoprovision = docker_volume_configuration.value.autoprovision
          driver        = docker_volume_configuration.value.driver
          driver_opts   = docker_volume_configuration.value.driver_opts
          labels        = docker_volume_configuration.value.labels
          scope         = docker_volume_configuration.value.scope
        }
      }

      dynamic "efs_volume_configuration" {
        for_each = volume.value.efs_volume_configuration != null ? volume.value.efs_volume_configuration : []
        content {
          file_system_id          = efs_volume_configuration.value.file_system_id
          root_directory          = efs_volume_configuration.value.root_directory
          transit_encryption      = efs_volume_configuration.value.transit_encryption
          transit_encryption_port = efs_volume_configuration.value.transit_encryption_port

          dynamic "authorization_config" {
            for_each = efs_volume_configuration.value.authorization_config != null ? efs_volume_configuration.value.authorization_config : []
            content {
              access_point_id = authorization_config.value.access_point_id
              iam             = authorization_config.value.iam
            }
          }
        }
      }

      dynamic "fsx_windows_file_server_volume_configuration" {
        for_each = volume.value.fsx_windows_file_server_volume_configuration != null ? volume.value.fsx_windows_file_server_volume_configuration : []
        content {
          file_system_id = fsx_windows_file_server_volume_configuration.value.file_system_id
          root_directory = fsx_windows_file_server_volume_configuration.value.root_directory

          dynamic "authorization_config" {
            for_each = fsx_windows_file_server_volume_configuration.value.authorization_config != null ? fsx_windows_file_server_volume_configuration.value.authorization_config : []
            content {
              credentials_parameter = authorization_config.value.credentials_parameter
              domain                = authorization_config.value.domain
            }
          }
        }
      }

      dynamic "s3files_volume_configuration" {
        for_each = volume.value.s3files_volume_configuration != null ? volume.value.s3files_volume_configuration : []
        content {
          file_system_arn         = s3files_volume_configuration.value.file_system_arn
          access_point_arn        = s3files_volume_configuration.value.access_point_arn
          root_directory          = s3files_volume_configuration.value.root_directory
          transit_encryption_port = s3files_volume_configuration.value.transit_encryption_port
        }
      }
    }
  }
}
