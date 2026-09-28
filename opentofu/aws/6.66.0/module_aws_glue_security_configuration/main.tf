resource "aws_glue_security_configuration" "glue_security_configurations" {
  for_each = var.glue_security_configurations

  name   = each.value.name
  region = each.value.region

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {

      dynamic "cloudwatch_encryption" {
        for_each = encryption_configuration.value.cloudwatch_encryption != null ? encryption_configuration.value.cloudwatch_encryption : []
        content {
          cloudwatch_encryption_mode = cloudwatch_encryption.value.cloudwatch_encryption_mode
          kms_key_arn                = cloudwatch_encryption.value.kms_key_arn
        }
      }

      dynamic "job_bookmarks_encryption" {
        for_each = encryption_configuration.value.job_bookmarks_encryption != null ? encryption_configuration.value.job_bookmarks_encryption : []
        content {
          job_bookmarks_encryption_mode = job_bookmarks_encryption.value.job_bookmarks_encryption_mode
          kms_key_arn                   = job_bookmarks_encryption.value.kms_key_arn
        }
      }

      dynamic "s3_encryption" {
        for_each = encryption_configuration.value.s3_encryption != null ? encryption_configuration.value.s3_encryption : []
        content {
          kms_key_arn        = s3_encryption.value.kms_key_arn
          s3_encryption_mode = s3_encryption.value.s3_encryption_mode
        }
      }
    }
  }
}
