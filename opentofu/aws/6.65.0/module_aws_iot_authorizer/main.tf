resource "aws_iot_authorizer" "iot_authorizers" {
  for_each = var.iot_authorizers

  authorizer_function_arn   = each.value.authorizer_function_arn
  name                      = each.value.name
  enable_caching_for_http   = each.value.enable_caching_for_http
  region                    = each.value.region
  signing_disabled          = each.value.signing_disabled
  status                    = each.value.status
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  token_key_name            = each.value.token_key_name
  token_signing_public_keys = each.value.token_signing_public_keys
}
