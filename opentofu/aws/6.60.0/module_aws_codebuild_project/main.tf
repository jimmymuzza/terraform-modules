resource "aws_codebuild_project" "codebuild_projects" {
  for_each = var.codebuild_projects

  name                   = each.value.name
  service_role           = each.value.service_role
  auto_retry_limit       = each.value.auto_retry_limit
  badge_enabled          = each.value.badge_enabled
  build_timeout          = each.value.build_timeout
  concurrent_build_limit = each.value.concurrent_build_limit
  description            = each.value.description
  encryption_key         = each.value.encryption_key
  project_visibility     = each.value.project_visibility
  queued_timeout         = each.value.queued_timeout
  region                 = each.value.region
  resource_access_role   = each.value.resource_access_role
  source_version         = each.value.source_version
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "artifacts" {
    for_each = each.value.artifacts != null ? each.value.artifacts : []
    content {
      type                   = artifacts.value.type
      artifact_identifier    = artifacts.value.artifact_identifier
      bucket_owner_access    = artifacts.value.bucket_owner_access
      encryption_disabled    = artifacts.value.encryption_disabled
      location               = artifacts.value.location
      name                   = artifacts.value.name
      namespace_type         = artifacts.value.namespace_type
      override_artifact_name = artifacts.value.override_artifact_name
      packaging              = artifacts.value.packaging
      path                   = artifacts.value.path
    }
  }

  dynamic "build_batch_config" {
    for_each = each.value.build_batch_config != null ? each.value.build_batch_config : []
    content {
      service_role      = build_batch_config.value.service_role
      combine_artifacts = build_batch_config.value.combine_artifacts
      timeout_in_mins   = build_batch_config.value.timeout_in_mins

      dynamic "restrictions" {
        for_each = build_batch_config.value.restrictions != null ? build_batch_config.value.restrictions : []
        content {
          compute_types_allowed  = restrictions.value.compute_types_allowed
          maximum_builds_allowed = restrictions.value.maximum_builds_allowed
        }
      }
    }
  }

  dynamic "cache" {
    for_each = each.value.cache != null ? each.value.cache : []
    content {
      cache_namespace = cache.value.cache_namespace
      location        = cache.value.location
      modes           = cache.value.modes
      type            = cache.value.type
    }
  }

  dynamic "environment" {
    for_each = each.value.environment != null ? each.value.environment : []
    content {
      compute_type                = environment.value.compute_type
      image                       = environment.value.image
      type                        = environment.value.type
      certificate                 = environment.value.certificate
      host_kernel                 = environment.value.host_kernel
      image_pull_credentials_type = environment.value.image_pull_credentials_type
      privileged_mode             = environment.value.privileged_mode

      dynamic "docker_server" {
        for_each = environment.value.docker_server != null ? environment.value.docker_server : []
        content {
          compute_type       = docker_server.value.compute_type
          security_group_ids = docker_server.value.security_group_ids
        }
      }

      dynamic "environment_variable" {
        for_each = environment.value.environment_variable != null ? environment.value.environment_variable : []
        content {
          name  = environment_variable.value.name
          value = environment_variable.value.value
          type  = environment_variable.value.type
        }
      }

      dynamic "fleet" {
        for_each = environment.value.fleet != null ? environment.value.fleet : []
        content {
          fleet_arn = fleet.value.fleet_arn
        }
      }

      dynamic "registry_credential" {
        for_each = environment.value.registry_credential != null ? environment.value.registry_credential : []
        content {
          credential          = registry_credential.value.credential
          credential_provider = registry_credential.value.credential_provider
        }
      }
    }
  }

  dynamic "file_system_locations" {
    for_each = each.value.file_system_locations != null ? each.value.file_system_locations : []
    content {
      identifier    = file_system_locations.value.identifier
      location      = file_system_locations.value.location
      mount_options = file_system_locations.value.mount_options
      mount_point   = file_system_locations.value.mount_point
      type          = file_system_locations.value.type
    }
  }

  dynamic "logs_config" {
    for_each = each.value.logs_config != null ? each.value.logs_config : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = logs_config.value.cloudwatch_logs != null ? logs_config.value.cloudwatch_logs : []
        content {
          group_name  = cloudwatch_logs.value.group_name
          status      = cloudwatch_logs.value.status
          stream_name = cloudwatch_logs.value.stream_name
        }
      }

      dynamic "s3_logs" {
        for_each = logs_config.value.s3_logs != null ? logs_config.value.s3_logs : []
        content {
          bucket_owner_access = s3_logs.value.bucket_owner_access
          encryption_disabled = s3_logs.value.encryption_disabled
          location            = s3_logs.value.location
          status              = s3_logs.value.status
        }
      }
    }
  }

  dynamic "secondary_artifacts" {
    for_each = each.value.secondary_artifacts != null ? each.value.secondary_artifacts : []
    content {
      artifact_identifier    = secondary_artifacts.value.artifact_identifier
      type                   = secondary_artifacts.value.type
      bucket_owner_access    = secondary_artifacts.value.bucket_owner_access
      encryption_disabled    = secondary_artifacts.value.encryption_disabled
      location               = secondary_artifacts.value.location
      name                   = secondary_artifacts.value.name
      namespace_type         = secondary_artifacts.value.namespace_type
      override_artifact_name = secondary_artifacts.value.override_artifact_name
      packaging              = secondary_artifacts.value.packaging
      path                   = secondary_artifacts.value.path
    }
  }

  dynamic "secondary_source_version" {
    for_each = each.value.secondary_source_version != null ? each.value.secondary_source_version : []
    content {
      source_identifier = secondary_source_version.value.source_identifier
      source_version    = secondary_source_version.value.source_version
    }
  }

  dynamic "secondary_sources" {
    for_each = each.value.secondary_sources != null ? each.value.secondary_sources : []
    content {
      source_identifier   = secondary_sources.value.source_identifier
      type                = secondary_sources.value.type
      buildspec           = secondary_sources.value.buildspec
      git_clone_depth     = secondary_sources.value.git_clone_depth
      insecure_ssl        = secondary_sources.value.insecure_ssl
      location            = secondary_sources.value.location
      report_build_status = secondary_sources.value.report_build_status

      dynamic "auth" {
        for_each = secondary_sources.value.auth != null ? secondary_sources.value.auth : []
        content {
          resource = auth.value.resource
          type     = auth.value.type
        }
      }

      dynamic "build_status_config" {
        for_each = secondary_sources.value.build_status_config != null ? secondary_sources.value.build_status_config : []
        content {
          context    = build_status_config.value.context
          target_url = build_status_config.value.target_url
        }
      }

      dynamic "git_submodules_config" {
        for_each = secondary_sources.value.git_submodules_config != null ? secondary_sources.value.git_submodules_config : []
        content {
          fetch_submodules = git_submodules_config.value.fetch_submodules
        }
      }
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      type                = source.value.type
      buildspec           = source.value.buildspec
      git_clone_depth     = source.value.git_clone_depth
      insecure_ssl        = source.value.insecure_ssl
      location            = source.value.location
      report_build_status = source.value.report_build_status

      dynamic "auth" {
        for_each = source.value.auth != null ? source.value.auth : []
        content {
          resource = auth.value.resource
          type     = auth.value.type
        }
      }

      dynamic "build_status_config" {
        for_each = source.value.build_status_config != null ? source.value.build_status_config : []
        content {
          context    = build_status_config.value.context
          target_url = build_status_config.value.target_url
        }
      }

      dynamic "git_submodules_config" {
        for_each = source.value.git_submodules_config != null ? source.value.git_submodules_config : []
        content {
          fetch_submodules = git_submodules_config.value.fetch_submodules
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
      vpc_id             = vpc_config.value.vpc_id
    }
  }
}
