resource "aws_transcribe_language_model" "transcribe_language_models" {
  for_each = var.transcribe_language_models

  base_model_name = each.value.base_model_name
  language_code   = each.value.language_code
  model_name      = each.value.model_name
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "input_data_config" {
    for_each = each.value.input_data_config != null ? each.value.input_data_config : []
    content {
      data_access_role_arn = input_data_config.value.data_access_role_arn
      s3_uri               = input_data_config.value.s3_uri
      tuning_data_s3_uri   = input_data_config.value.tuning_data_s3_uri
    }
  }
}
