resource "aws_sagemaker_pipeline" "sagemaker_pipelines" {
  for_each = var.sagemaker_pipelines

  pipeline_display_name = each.value.pipeline_display_name
  pipeline_name         = each.value.pipeline_name
  pipeline_definition   = each.value.pipeline_definition
  pipeline_description  = each.value.pipeline_description
  region                = each.value.region
  role_arn              = each.value.role_arn
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "parallelism_configuration" {
    for_each = each.value.parallelism_configuration != null ? each.value.parallelism_configuration : []
    content {
      max_parallel_execution_steps = parallelism_configuration.value.max_parallel_execution_steps
    }
  }

  dynamic "pipeline_definition_s3_location" {
    for_each = each.value.pipeline_definition_s3_location != null ? each.value.pipeline_definition_s3_location : []
    content {
      bucket     = pipeline_definition_s3_location.value.bucket
      object_key = pipeline_definition_s3_location.value.object_key
      version_id = pipeline_definition_s3_location.value.version_id
    }
  }
}
