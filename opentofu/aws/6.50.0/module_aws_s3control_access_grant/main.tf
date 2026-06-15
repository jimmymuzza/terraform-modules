resource "aws_s3control_access_grant" "s3control_access_grants" {
  for_each = var.s3control_access_grants

  access_grants_location_id = each.value.access_grants_location_id
  permission                = each.value.permission
  account_id                = each.value.account_id
  region                    = each.value.region
  s3_prefix_type            = each.value.s3_prefix_type
  tags                      = each.value.tags

  dynamic "access_grants_location_configuration" {
    for_each = each.value.access_grants_location_configuration != null ? each.value.access_grants_location_configuration : []
    content {
      s3_sub_prefix = access_grants_location_configuration.value.s3_sub_prefix
    }
  }

  dynamic "grantee" {
    for_each = each.value.grantee != null ? each.value.grantee : []
    content {
      grantee_identifier = grantee.value.grantee_identifier
      grantee_type       = grantee.value.grantee_type
    }
  }
}
