resource "aws_s3_bucket_versioning" "s3_bucket_versionings" {
  for_each = var.s3_bucket_versionings

  bucket                = each.value.bucket
  expected_bucket_owner = each.value.expected_bucket_owner
  mfa                   = each.value.mfa
  region                = each.value.region

  dynamic "versioning_configuration" {
    for_each = each.value.versioning_configuration != null ? each.value.versioning_configuration : []
    content {
      status     = versioning_configuration.value.status
      mfa_delete = versioning_configuration.value.mfa_delete
    }
  }
}
