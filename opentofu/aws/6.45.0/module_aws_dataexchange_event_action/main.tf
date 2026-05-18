resource "aws_dataexchange_event_action" "dataexchange_event_actions" {
  for_each = var.dataexchange_event_actions

  region = each.value.region

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {

      dynamic "export_revision_to_s3" {
        for_each = action.value.export_revision_to_s3 != null ? action.value.export_revision_to_s3 : []
        content {

          dynamic "encryption" {
            for_each = export_revision_to_s3.value.encryption != null ? export_revision_to_s3.value.encryption : []
            content {
              kms_key_arn = encryption.value.kms_key_arn
              type        = encryption.value.type
            }
          }

          dynamic "revision_destination" {
            for_each = export_revision_to_s3.value.revision_destination != null ? export_revision_to_s3.value.revision_destination : []
            content {
              bucket      = revision_destination.value.bucket
              key_pattern = revision_destination.value.key_pattern
            }
          }
        }
      }
    }
  }

  dynamic "event" {
    for_each = each.value.event != null ? each.value.event : []
    content {

      dynamic "revision_published" {
        for_each = event.value.revision_published != null ? event.value.revision_published : []
        content {
          data_set_id = revision_published.value.data_set_id
        }
      }
    }
  }
}
