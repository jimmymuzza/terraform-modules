resource "aws_accountaccess_entitlement" "accountaccess_entitlements" {
  for_each = var.accountaccess_entitlements

  application_arn = each.value.application_arn
  region          = each.value.region

  dynamic "entitlement" {
    for_each = each.value.entitlement != null ? each.value.entitlement : []
    content {

      dynamic "principal_role" {
        for_each = entitlement.value.principal_role != null ? entitlement.value.principal_role : []
        content {
          role_arn = principal_role.value.role_arn

          dynamic "principal" {
            for_each = principal_role.value.principal != null ? principal_role.value.principal : []
            content {

              dynamic "identity_center" {
                for_each = principal.value.identity_center != null ? principal.value.identity_center : []
                content {
                  group_id = identity_center.value.group_id
                  user_id  = identity_center.value.user_id
                }
              }
            }
          }
        }
      }
    }
  }
}
