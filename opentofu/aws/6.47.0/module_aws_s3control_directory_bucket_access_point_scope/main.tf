resource "aws_s3control_directory_bucket_access_point_scope" "s3control_directory_bucket_access_point_scopes" {
  for_each = var.s3control_directory_bucket_access_point_scopes

  account_id = each.value.account_id
  name       = each.value.name
  region     = each.value.region

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      permissions = scope.value.permissions
      prefixes    = scope.value.prefixes
    }
  }
}
