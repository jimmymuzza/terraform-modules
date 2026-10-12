resource "aws_bedrockagentcore_api_key_credential_provider" "bedrockagentcore_api_key_credential_providers" {
  for_each = var.bedrockagentcore_api_key_credential_providers

  name                  = each.value.name
  api_key               = each.value.api_key
  api_key_secret_source = each.value.api_key_secret_source
  api_key_wo            = each.value.api_key_wo
  api_key_wo_version    = each.value.api_key_wo_version
  region                = each.value.region
  tags                  = each.value.tags

  dynamic "api_key_secret_config" {
    for_each = each.value.api_key_secret_config != null ? each.value.api_key_secret_config : []
    content {
      json_key  = api_key_secret_config.value.json_key
      secret_id = api_key_secret_config.value.secret_id
    }
  }
}
