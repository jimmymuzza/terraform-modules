resource "aws_codepipeline" "codepipelines" {
  for_each = var.codepipelines

  name           = each.value.name
  role_arn       = each.value.role_arn
  execution_mode = each.value.execution_mode
  pipeline_type  = each.value.pipeline_type
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  dynamic "artifact_store" {
    for_each = each.value.artifact_store != null ? each.value.artifact_store : []
    content {
      location = artifact_store.value.location
      type     = artifact_store.value.type
      region   = artifact_store.value.region

      dynamic "encryption_key" {
        for_each = artifact_store.value.encryption_key != null ? artifact_store.value.encryption_key : []
        content {
          type = encryption_key.value.type
        }
      }
    }
  }

  dynamic "stage" {
    for_each = each.value.stage != null ? each.value.stage : []
    content {
      name = stage.value.name

      dynamic "action" {
        for_each = stage.value.action != null ? stage.value.action : []
        content {
          category           = action.value.category
          name               = action.value.name
          owner              = action.value.owner
          provider           = action.value.provider
          version            = action.value.version
          commands           = action.value.commands
          configuration      = action.value.configuration
          input_artifacts    = action.value.input_artifacts
          namespace          = action.value.namespace
          output_artifacts   = action.value.output_artifacts
          output_variables   = action.value.output_variables
          region             = action.value.region
          role_arn           = action.value.role_arn
          run_order          = action.value.run_order
          timeout_in_minutes = action.value.timeout_in_minutes

          dynamic "output_artifacts_for_compute_action" {
            for_each = action.value.output_artifacts_for_compute_action != null ? action.value.output_artifacts_for_compute_action : []
            content {
              name  = output_artifacts_for_compute_action.value.name
              files = output_artifacts_for_compute_action.value.files
            }
          }
        }
      }

      dynamic "before_entry" {
        for_each = stage.value.before_entry != null ? stage.value.before_entry : []
        content {

          dynamic "condition" {
            for_each = before_entry.value.condition != null ? before_entry.value.condition : []
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule != null ? condition.value.rule : []
                content {
                  name               = rule.value.name
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id != null ? rule.value.rule_type_id : []
                    content {
                      category = rule_type_id.value.category
                      provider = rule_type_id.value.provider
                      owner    = rule_type_id.value.owner
                      version  = rule_type_id.value.version
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "on_failure" {
        for_each = stage.value.on_failure != null ? stage.value.on_failure : []
        content {
          result = on_failure.value.result

          dynamic "condition" {
            for_each = on_failure.value.condition != null ? on_failure.value.condition : []
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule != null ? condition.value.rule : []
                content {
                  name               = rule.value.name
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id != null ? rule.value.rule_type_id : []
                    content {
                      category = rule_type_id.value.category
                      provider = rule_type_id.value.provider
                      owner    = rule_type_id.value.owner
                      version  = rule_type_id.value.version
                    }
                  }
                }
              }
            }
          }

          dynamic "retry_configuration" {
            for_each = on_failure.value.retry_configuration != null ? on_failure.value.retry_configuration : []
            content {
              retry_mode = retry_configuration.value.retry_mode
            }
          }
        }
      }

      dynamic "on_success" {
        for_each = stage.value.on_success != null ? stage.value.on_success : []
        content {

          dynamic "condition" {
            for_each = on_success.value.condition != null ? on_success.value.condition : []
            content {
              result = condition.value.result

              dynamic "rule" {
                for_each = condition.value.rule != null ? condition.value.rule : []
                content {
                  name               = rule.value.name
                  commands           = rule.value.commands
                  configuration      = rule.value.configuration
                  input_artifacts    = rule.value.input_artifacts
                  region             = rule.value.region
                  role_arn           = rule.value.role_arn
                  timeout_in_minutes = rule.value.timeout_in_minutes

                  dynamic "rule_type_id" {
                    for_each = rule.value.rule_type_id != null ? rule.value.rule_type_id : []
                    content {
                      category = rule_type_id.value.category
                      provider = rule_type_id.value.provider
                      owner    = rule_type_id.value.owner
                      version  = rule_type_id.value.version
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "trigger" {
    for_each = each.value.trigger != null ? each.value.trigger : []
    content {
      provider_type = trigger.value.provider_type

      dynamic "git_configuration" {
        for_each = trigger.value.git_configuration != null ? trigger.value.git_configuration : []
        content {
          source_action_name = git_configuration.value.source_action_name

          dynamic "pull_request" {
            for_each = git_configuration.value.pull_request != null ? git_configuration.value.pull_request : []
            content {
              events = pull_request.value.events

              dynamic "branches" {
                for_each = pull_request.value.branches != null ? pull_request.value.branches : []
                content {
                  excludes = branches.value.excludes
                  includes = branches.value.includes
                }
              }

              dynamic "file_paths" {
                for_each = pull_request.value.file_paths != null ? pull_request.value.file_paths : []
                content {
                  excludes = file_paths.value.excludes
                  includes = file_paths.value.includes
                }
              }
            }
          }

          dynamic "push" {
            for_each = git_configuration.value.push != null ? git_configuration.value.push : []
            content {

              dynamic "branches" {
                for_each = push.value.branches != null ? push.value.branches : []
                content {
                  excludes = branches.value.excludes
                  includes = branches.value.includes
                }
              }

              dynamic "file_paths" {
                for_each = push.value.file_paths != null ? push.value.file_paths : []
                content {
                  excludes = file_paths.value.excludes
                  includes = file_paths.value.includes
                }
              }

              dynamic "tags" {
                for_each = push.value.tags != null ? push.value.tags : []
                content {
                  excludes = tags.value.excludes
                  includes = tags.value.includes
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "variable" {
    for_each = each.value.variable != null ? each.value.variable : []
    content {
      name          = variable.value.name
      default_value = variable.value.default_value
      description   = variable.value.description
    }
  }
}
