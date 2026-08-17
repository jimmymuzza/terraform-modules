resource "aws_s3_bucket_replication_configuration" "s3_bucket_replication_configurations" {
  for_each = var.s3_bucket_replication_configurations

  bucket = each.value.bucket
  role   = each.value.role
  region = each.value.region
  token  = each.value.token

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      status   = rule.value.status
      prefix   = rule.value.prefix
      priority = rule.value.priority

      dynamic "delete_marker_replication" {
        for_each = rule.value.delete_marker_replication != null ? rule.value.delete_marker_replication : []
        content {
          status = delete_marker_replication.value.status
        }
      }

      dynamic "destination" {
        for_each = rule.value.destination != null ? rule.value.destination : []
        content {
          bucket        = destination.value.bucket
          account       = destination.value.account
          storage_class = destination.value.storage_class

          dynamic "access_control_translation" {
            for_each = destination.value.access_control_translation != null ? destination.value.access_control_translation : []
            content {
              owner = access_control_translation.value.owner
            }
          }

          dynamic "encryption_configuration" {
            for_each = destination.value.encryption_configuration != null ? destination.value.encryption_configuration : []
            content {
              replica_kms_key_id = encryption_configuration.value.replica_kms_key_id
            }
          }

          dynamic "metrics" {
            for_each = destination.value.metrics != null ? destination.value.metrics : []
            content {
              status = metrics.value.status

              dynamic "event_threshold" {
                for_each = metrics.value.event_threshold != null ? metrics.value.event_threshold : []
                content {
                  minutes = event_threshold.value.minutes
                }
              }
            }
          }

          dynamic "replication_time" {
            for_each = destination.value.replication_time != null ? destination.value.replication_time : []
            content {
              status = replication_time.value.status

              dynamic "time" {
                for_each = replication_time.value.time != null ? replication_time.value.time : []
                content {
                  minutes = time.value.minutes
                }
              }
            }
          }
        }
      }

      dynamic "existing_object_replication" {
        for_each = rule.value.existing_object_replication != null ? rule.value.existing_object_replication : []
        content {
          status = existing_object_replication.value.status
        }
      }

      dynamic "filter" {
        for_each = rule.value.filter != null ? rule.value.filter : []
        content {
          prefix = filter.value.prefix

          dynamic "and" {
            for_each = filter.value.and != null ? filter.value.and : []
            content {
              prefix = and.value.prefix
              tags   = and.value.tags
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

      dynamic "source_selection_criteria" {
        for_each = rule.value.source_selection_criteria != null ? rule.value.source_selection_criteria : []
        content {

          dynamic "replica_modifications" {
            for_each = source_selection_criteria.value.replica_modifications != null ? source_selection_criteria.value.replica_modifications : []
            content {
              status = replica_modifications.value.status
            }
          }

          dynamic "sse_kms_encrypted_objects" {
            for_each = source_selection_criteria.value.sse_kms_encrypted_objects != null ? source_selection_criteria.value.sse_kms_encrypted_objects : []
            content {
              status = sse_kms_encrypted_objects.value.status
            }
          }
        }
      }
    }
  }
}
