resource "aws_eks_identity_provider_config" "eks_identity_provider_configs" {
  for_each = var.eks_identity_provider_configs

  cluster_name = each.value.cluster_name
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "oidc" {
    for_each = each.value.oidc != null ? each.value.oidc : []
    content {
      client_id                     = oidc.value.client_id
      identity_provider_config_name = oidc.value.identity_provider_config_name
      issuer_url                    = oidc.value.issuer_url
      groups_claim                  = oidc.value.groups_claim
      groups_prefix                 = oidc.value.groups_prefix
      required_claims               = oidc.value.required_claims
      username_claim                = oidc.value.username_claim
      username_prefix               = oidc.value.username_prefix
    }
  }
}
