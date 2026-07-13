resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle_configurations" {
  for_each = var.s3_bucket_lifecycle_configurations

  bucket                                 = each.value.bucket
  expected_bucket_owner                  = each.value.expected_bucket_owner
  region                                 = each.value.region
  transition_default_minimum_object_size = each.value.transition_default_minimum_object_size

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      status = rule.value.status
      prefix = rule.value.prefix

      dynamic "abort_incomplete_multipart_upload" {
        for_each = rule.value.abort_incomplete_multipart_upload != null ? rule.value.abort_incomplete_multipart_upload : []
        content {
          days_after_initiation = abort_incomplete_multipart_upload.value.days_after_initiation
        }
      }

      dynamic "expiration" {
        for_each = rule.value.expiration != null ? rule.value.expiration : []
        content {
          date                         = expiration.value.date
          days                         = expiration.value.days
          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      dynamic "filter" {
        for_each = rule.value.filter != null ? rule.value.filter : []
        content {
          object_size_greater_than = filter.value.object_size_greater_than
          object_size_less_than    = filter.value.object_size_less_than
          prefix                   = filter.value.prefix

          dynamic "and" {
            for_each = filter.value.and != null ? filter.value.and : []
            content {
              object_size_greater_than = and.value.object_size_greater_than
              object_size_less_than    = and.value.object_size_less_than
              prefix                   = and.value.prefix
              tags                     = and.value.tags
            }
          }

          dynamic "tag" {
            for_each = filter.value.tag != null ? filter.value.tag : []
            content {
              key   = tag.value.key
              value = tag.value.value
            }
          }
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = rule.value.noncurrent_version_expiration != null ? rule.value.noncurrent_version_expiration : []
        content {
          noncurrent_days           = noncurrent_version_expiration.value.noncurrent_days
          newer_noncurrent_versions = noncurrent_version_expiration.value.newer_noncurrent_versions
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = rule.value.noncurrent_version_transition != null ? rule.value.noncurrent_version_transition : []
        content {
          noncurrent_days           = noncurrent_version_transition.value.noncurrent_days
          storage_class             = noncurrent_version_transition.value.storage_class
          newer_noncurrent_versions = noncurrent_version_transition.value.newer_noncurrent_versions
        }
      }

      dynamic "transition" {
        for_each = rule.value.transition != null ? rule.value.transition : []
        content {
          storage_class = transition.value.storage_class
          date          = transition.value.date
          days          = transition.value.days
        }
      }
    }
  }
}
