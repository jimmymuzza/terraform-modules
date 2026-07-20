variable "codepipelines" {
  description = <<EOT
Map of codepipelines, attributes below
Required:
    - name
    - role_arn
    - artifact_store
    - stage
Optional:
    - execution_mode
    - pipeline_type
    - region
    - tags
    - tags_all
    - trigger
    - variable
EOT

  type = map(object({
    name           = string
    role_arn       = string
    execution_mode = optional(string)
    pipeline_type  = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    artifact_store = set(object({
            location       = string
            type           = string
            region         = optional(string)
            encryption_key = optional(list(object({
                type = string
            })))
        }))
    stage          = list(object({
            name         = string
            action       = list(object({
                category           = string
                name               = string
                owner              = string
                provider           = string
                version            = string
                configuration      = optional(map(string))
                input_artifacts    = optional(list(string))
                namespace          = optional(string)
                output_artifacts   = optional(list(string))
                region             = optional(string)
                role_arn           = optional(string)
                run_order          = optional(number)
                timeout_in_minutes = optional(number)
            }))
            before_entry = optional(list(object({
                condition = list(object({
                    result = optional(string)
                    rule   = list(object({
                        name               = string
                        commands           = optional(list(string))
                        configuration      = optional(map(string))
                        input_artifacts    = optional(list(string))
                        region             = optional(string)
                        role_arn           = optional(string)
                        timeout_in_minutes = optional(number)
                        rule_type_id       = list(object({
                            category = string
                            provider = string
                            owner    = optional(string)
                            version  = optional(string)
                        }))
                    }))
                }))
            })))
            on_failure   = optional(list(object({
                result              = optional(string)
                condition           = optional(list(object({
                    result = optional(string)
                    rule   = list(object({
                        name               = string
                        commands           = optional(list(string))
                        configuration      = optional(map(string))
                        input_artifacts    = optional(list(string))
                        region             = optional(string)
                        role_arn           = optional(string)
                        timeout_in_minutes = optional(number)
                        rule_type_id       = list(object({
                            category = string
                            provider = string
                            owner    = optional(string)
                            version  = optional(string)
                        }))
                    }))
                })))
                retry_configuration = optional(list(object({
                    retry_mode = optional(string)
                })))
            })))
            on_success   = optional(list(object({
                condition = list(object({
                    result = optional(string)
                    rule   = list(object({
                        name               = string
                        commands           = optional(list(string))
                        configuration      = optional(map(string))
                        input_artifacts    = optional(list(string))
                        region             = optional(string)
                        role_arn           = optional(string)
                        timeout_in_minutes = optional(number)
                        rule_type_id       = list(object({
                            category = string
                            provider = string
                            owner    = optional(string)
                            version  = optional(string)
                        }))
                    }))
                }))
            })))
        }))
    trigger        = optional(list(object({
            provider_type     = string
            git_configuration = list(object({
                source_action_name = string
                pull_request       = optional(list(object({
                    events     = optional(list(string))
                    branches   = optional(list(object({
                        excludes = optional(list(string))
                        includes = optional(list(string))
                    })))
                    file_paths = optional(list(object({
                        excludes = optional(list(string))
                        includes = optional(list(string))
                    })))
                })))
                push               = optional(list(object({
                    branches   = optional(list(object({
                        excludes = optional(list(string))
                        includes = optional(list(string))
                    })))
                    file_paths = optional(list(object({
                        excludes = optional(list(string))
                        includes = optional(list(string))
                    })))
                    tags       = optional(list(object({
                        excludes = optional(list(string))
                        includes = optional(list(string))
                    })))
                })))
            }))
        })))
    variable       = optional(list(object({
            name          = string
            default_value = optional(string)
            description   = optional(string)
        })))
  }))
}
