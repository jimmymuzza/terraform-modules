variable "codebuild_projects" {
  description = <<EOT
Map of codebuild_projects, attributes below
Required:
    - name
    - service_role
    - artifacts
    - environment
    - source
Optional:
    - auto_retry_limit
    - badge_enabled
    - build_timeout
    - concurrent_build_limit
    - description
    - encryption_key
    - project_visibility
    - queued_timeout
    - region
    - resource_access_role
    - source_version
    - tags
    - tags_all
    - build_batch_config
    - cache
    - file_system_locations
    - logs_config
    - secondary_artifacts
    - secondary_source_version
    - secondary_sources
    - vpc_config
EOT

  type = map(object({
    name                     = string
    service_role             = string
    auto_retry_limit         = optional(number)
    badge_enabled            = optional(bool)
    build_timeout            = optional(number)
    concurrent_build_limit   = optional(number)
    description              = optional(string)
    encryption_key           = optional(string)
    project_visibility       = optional(string)
    queued_timeout           = optional(number)
    region                   = optional(string)
    resource_access_role     = optional(string)
    source_version           = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    artifacts                = list(object({
            type                   = string
            artifact_identifier    = optional(string)
            bucket_owner_access    = optional(string)
            encryption_disabled    = optional(bool)
            location               = optional(string)
            name                   = optional(string)
            namespace_type         = optional(string)
            override_artifact_name = optional(bool)
            packaging              = optional(string)
            path                   = optional(string)
        }))
    build_batch_config       = optional(list(object({
            service_role      = string
            combine_artifacts = optional(bool)
            timeout_in_mins   = optional(number)
            restrictions      = optional(list(object({
                compute_types_allowed  = optional(list(string))
                maximum_builds_allowed = optional(number)
            })))
        })))
    cache                    = optional(list(object({
            cache_namespace = optional(string)
            location        = optional(string)
            modes           = optional(list(string))
            type            = optional(string)
        })))
    environment              = list(object({
            compute_type                = string
            image                       = string
            type                        = string
            certificate                 = optional(string)
            host_kernel                 = optional(string)
            image_pull_credentials_type = optional(string)
            privileged_mode             = optional(bool)
            docker_server               = optional(list(object({
                compute_type       = string
                security_group_ids = optional(list(string))
            })))
            environment_variable        = optional(list(object({
                name  = string
                value = string
                type  = optional(string)
            })))
            fleet                       = optional(list(object({
                fleet_arn = optional(string)
            })))
            registry_credential         = optional(list(object({
                credential          = string
                credential_provider = string
            })))
        }))
    file_system_locations    = optional(set(object({
            identifier    = optional(string)
            location      = optional(string)
            mount_options = optional(string)
            mount_point   = optional(string)
            type          = optional(string)
        })))
    logs_config              = optional(list(object({
            cloudwatch_logs = optional(list(object({
                group_name  = optional(string)
                status      = optional(string)
                stream_name = optional(string)
            })))
            s3_logs         = optional(list(object({
                bucket_owner_access = optional(string)
                encryption_disabled = optional(bool)
                location            = optional(string)
                status              = optional(string)
            })))
        })))
    secondary_artifacts      = optional(set(object({
            artifact_identifier    = string
            type                   = string
            bucket_owner_access    = optional(string)
            encryption_disabled    = optional(bool)
            location               = optional(string)
            name                   = optional(string)
            namespace_type         = optional(string)
            override_artifact_name = optional(bool)
            packaging              = optional(string)
            path                   = optional(string)
        })))
    secondary_source_version = optional(set(object({
            source_identifier = string
            source_version    = string
        })))
    secondary_sources        = optional(set(object({
            source_identifier     = string
            type                  = string
            buildspec             = optional(string)
            git_clone_depth       = optional(number)
            insecure_ssl          = optional(bool)
            location              = optional(string)
            report_build_status   = optional(bool)
            auth                  = optional(list(object({
                resource = string
                type     = string
            })))
            build_status_config   = optional(list(object({
                context    = optional(string)
                target_url = optional(string)
            })))
            git_submodules_config = optional(list(object({
                fetch_submodules = bool
            })))
        })))
    source                   = list(object({
            type                  = string
            buildspec             = optional(string)
            git_clone_depth       = optional(number)
            insecure_ssl          = optional(bool)
            location              = optional(string)
            report_build_status   = optional(bool)
            auth                  = optional(list(object({
                resource = string
                type     = string
            })))
            build_status_config   = optional(list(object({
                context    = optional(string)
                target_url = optional(string)
            })))
            git_submodules_config = optional(list(object({
                fetch_submodules = bool
            })))
        }))
    vpc_config               = optional(list(object({
            security_group_ids = set(string)
            subnets            = set(string)
            vpc_id             = string
        })))
  }))
}
