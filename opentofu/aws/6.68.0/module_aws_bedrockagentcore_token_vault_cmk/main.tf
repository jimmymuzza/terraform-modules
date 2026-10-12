resource "aws_bedrockagentcore_token_vault_cmk" "bedrockagentcore_token_vault_cmks" {
  for_each = var.bedrockagentcore_token_vault_cmks

  region         = each.value.region
  token_vault_id = each.value.token_vault_id

  dynamic "kms_configuration" {
    for_each = each.value.kms_configuration != null ? each.value.kms_configuration : []
    content {
      key_type    = kms_configuration.value.key_type
      kms_key_arn = kms_configuration.value.kms_key_arn
    }
  }
}
