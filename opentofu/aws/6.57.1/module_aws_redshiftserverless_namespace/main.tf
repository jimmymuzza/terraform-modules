resource "aws_redshiftserverless_namespace" "redshiftserverless_namespaces" {
  for_each = var.redshiftserverless_namespaces

  namespace_name                   = each.value.namespace_name
  admin_password_secret_kms_key_id = each.value.admin_password_secret_kms_key_id
  admin_user_password              = each.value.admin_user_password
  admin_user_password_wo           = each.value.admin_user_password_wo
  admin_user_password_wo_version   = each.value.admin_user_password_wo_version
  admin_username                   = each.value.admin_username
  db_name                          = each.value.db_name
  default_iam_role_arn             = each.value.default_iam_role_arn
  iam_roles                        = each.value.iam_roles
  kms_key_id                       = each.value.kms_key_id
  log_exports                      = each.value.log_exports
  manage_admin_password            = each.value.manage_admin_password
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
}
