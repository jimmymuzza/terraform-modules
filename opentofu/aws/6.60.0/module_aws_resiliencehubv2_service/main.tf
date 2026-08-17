resource "aws_resiliencehubv2_service" "resiliencehubv2_services" {
  for_each = var.resiliencehubv2_services

  name                 = each.value.name
  regions              = each.value.regions
  dependency_discovery = each.value.dependency_discovery
  description          = each.value.description
  kms_key_id           = each.value.kms_key_id
  policy_arn           = each.value.policy_arn
  region               = each.value.region
  tags                 = each.value.tags

  dynamic "permission_model" {
    for_each = each.value.permission_model != null ? each.value.permission_model : []
    content {
      invoker_role_name = permission_model.value.invoker_role_name

      dynamic "cross_account_role" {
        for_each = permission_model.value.cross_account_role != null ? permission_model.value.cross_account_role : []
        content {
          cross_account_role_arn = cross_account_role.value.cross_account_role_arn
          external_id            = cross_account_role.value.external_id
        }
      }
    }
  }
}
