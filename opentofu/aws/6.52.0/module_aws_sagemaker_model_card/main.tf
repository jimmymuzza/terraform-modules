resource "aws_sagemaker_model_card" "sagemaker_model_cards" {
  for_each = var.sagemaker_model_cards

  content           = each.value.content
  model_card_name   = each.value.model_card_name
  model_card_status = each.value.model_card_status
  region            = each.value.region
  tags              = each.value.tags

  dynamic "security_config" {
    for_each = each.value.security_config != null ? each.value.security_config : []
    content {
      kms_key_id = security_config.value.kms_key_id
    }
  }
}
