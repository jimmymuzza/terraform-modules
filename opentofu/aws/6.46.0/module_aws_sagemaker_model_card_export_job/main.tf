resource "aws_sagemaker_model_card_export_job" "sagemaker_model_card_export_jobs" {
  for_each = var.sagemaker_model_card_export_jobs

  model_card_export_job_name = each.value.model_card_export_job_name
  model_card_name            = each.value.model_card_name
  model_card_version         = each.value.model_card_version
  region                     = each.value.region

  dynamic "output_config" {
    for_each = each.value.output_config != null ? each.value.output_config : []
    content {
      s3_output_path = output_config.value.s3_output_path
    }
  }
}
