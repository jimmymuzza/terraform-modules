resource "aws_bedrock_use_case_for_model_access" "bedrock_use_case_for_model_accesses" {
  for_each = var.bedrock_use_case_for_model_accesses

  form_data = each.value.form_data
}
