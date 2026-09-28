resource "aws_athena_database" "athena_databases" {
  for_each = var.athena_databases

  name                  = each.value.name
  bucket                = each.value.bucket
  comment               = each.value.comment
  expected_bucket_owner = each.value.expected_bucket_owner
  force_destroy         = each.value.force_destroy
  properties            = each.value.properties
  region                = each.value.region
  workgroup             = each.value.workgroup

  dynamic "acl_configuration" {
    for_each = each.value.acl_configuration != null ? each.value.acl_configuration : []
    content {
      s3_acl_option = acl_configuration.value.s3_acl_option
    }
  }

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      encryption_option = encryption_configuration.value.encryption_option
      kms_key           = encryption_configuration.value.kms_key
    }
  }
}
