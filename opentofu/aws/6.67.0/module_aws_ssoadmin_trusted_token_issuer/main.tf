resource "aws_ssoadmin_trusted_token_issuer" "ssoadmin_trusted_token_issuers" {
  for_each = var.ssoadmin_trusted_token_issuers

  instance_arn              = each.value.instance_arn
  name                      = each.value.name
  trusted_token_issuer_type = each.value.trusted_token_issuer_type
  client_token              = each.value.client_token
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "trusted_token_issuer_configuration" {
    for_each = each.value.trusted_token_issuer_configuration != null ? each.value.trusted_token_issuer_configuration : []
    content {

      dynamic "oidc_jwt_configuration" {
        for_each = trusted_token_issuer_configuration.value.oidc_jwt_configuration != null ? trusted_token_issuer_configuration.value.oidc_jwt_configuration : []
        content {
          claim_attribute_path          = oidc_jwt_configuration.value.claim_attribute_path
          identity_store_attribute_path = oidc_jwt_configuration.value.identity_store_attribute_path
          issuer_url                    = oidc_jwt_configuration.value.issuer_url
          jwks_retrieval_option         = oidc_jwt_configuration.value.jwks_retrieval_option
        }
      }
    }
  }
}
