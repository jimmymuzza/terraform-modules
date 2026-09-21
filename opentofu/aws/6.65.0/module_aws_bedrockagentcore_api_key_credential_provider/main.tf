resource "aws_bedrockagentcore_api_key_credential_provider" "bedrockagentcore_api_key_credential_providers" {
  for_each = var.bedrockagentcore_api_key_credential_providers

  name               = each.value.name
  api_key            = each.value.api_key
  api_key_wo         = each.value.api_key_wo
  api_key_wo_version = each.value.api_key_wo_version
  region             = each.value.region
  tags               = each.value.tags
}
