resource "aws_accountaccess_application" "accountaccess_applications" {
  for_each = var.accountaccess_applications

  region = each.value.region
  tags   = each.value.tags

  dynamic "identity_source" {
    for_each = each.value.identity_source != null ? each.value.identity_source : []
    content {

      dynamic "identity_center" {
        for_each = identity_source.value.identity_center != null ? identity_source.value.identity_center : []
        content {
          instance_arn = identity_center.value.instance_arn
        }
      }
    }
  }
}
