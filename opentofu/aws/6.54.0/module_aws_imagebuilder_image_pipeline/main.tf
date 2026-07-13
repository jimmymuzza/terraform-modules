resource "aws_imagebuilder_image_pipeline" "imagebuilder_image_pipelines" {
  for_each = var.imagebuilder_image_pipelines

  infrastructure_configuration_arn = each.value.infrastructure_configuration_arn
  name                             = each.value.name
  container_recipe_arn             = each.value.container_recipe_arn
  description                      = each.value.description
  distribution_configuration_arn   = each.value.distribution_configuration_arn
  enhanced_image_metadata_enabled  = each.value.enhanced_image_metadata_enabled
  execution_role                   = each.value.execution_role
  image_recipe_arn                 = each.value.image_recipe_arn
  region                           = each.value.region
  status                           = each.value.status
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all

  dynamic "image_scanning_configuration" {
    for_each = each.value.image_scanning_configuration != null ? each.value.image_scanning_configuration : []
    content {
      image_scanning_enabled = image_scanning_configuration.value.image_scanning_enabled

      dynamic "ecr_configuration" {
        for_each = image_scanning_configuration.value.ecr_configuration != null ? image_scanning_configuration.value.ecr_configuration : []
        content {
          container_tags  = ecr_configuration.value.container_tags
          repository_name = ecr_configuration.value.repository_name
        }
      }
    }
  }

  dynamic "image_tests_configuration" {
    for_each = each.value.image_tests_configuration != null ? each.value.image_tests_configuration : []
    content {
      image_tests_enabled = image_tests_configuration.value.image_tests_enabled
      timeout_minutes     = image_tests_configuration.value.timeout_minutes
    }
  }

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {
      image_log_group_name    = logging_configuration.value.image_log_group_name
      pipeline_log_group_name = logging_configuration.value.pipeline_log_group_name
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      schedule_expression                = schedule.value.schedule_expression
      pipeline_execution_start_condition = schedule.value.pipeline_execution_start_condition
      timezone                           = schedule.value.timezone
    }
  }

  dynamic "workflow" {
    for_each = each.value.workflow != null ? each.value.workflow : []
    content {
      workflow_arn   = workflow.value.workflow_arn
      on_failure     = workflow.value.on_failure
      parallel_group = workflow.value.parallel_group

      dynamic "parameter" {
        for_each = workflow.value.parameter != null ? workflow.value.parameter : []
        content {
          name  = parameter.value.name
          value = parameter.value.value
        }
      }
    }
  }
}
