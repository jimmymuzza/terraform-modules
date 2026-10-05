resource "aws_s3_bucket_acl" "s3_bucket_acls" {
  for_each = var.s3_bucket_acls

  bucket                = each.value.bucket
  acl                   = each.value.acl
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region

  dynamic "access_control_policy" {
    for_each = each.value.access_control_policy != null ? each.value.access_control_policy : []
    content {

      dynamic "grant" {
        for_each = access_control_policy.value.grant != null ? access_control_policy.value.grant : []
        content {
          permission = grant.value.permission

          dynamic "grantee" {
            for_each = grant.value.grantee != null ? grant.value.grantee : []
            content {
              type          = grantee.value.type
              email_address = grantee.value.email_address
              uri           = grantee.value.uri
            }
          }
        }
      }

      dynamic "owner" {
        for_each = access_control_policy.value.owner != null ? access_control_policy.value.owner : []
        content {
          display_name = owner.value.display_name
        }
      }
    }
  }
}
