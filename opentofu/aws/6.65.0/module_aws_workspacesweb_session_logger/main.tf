resource "aws_workspacesweb_session_logger" "workspacesweb_session_loggers" {
  for_each = var.workspacesweb_session_loggers

  additional_encryption_context = each.value.additional_encryption_context
  customer_managed_key          = each.value.customer_managed_key
  display_name                  = each.value.display_name
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "event_filter" {
    for_each = each.value.event_filter != null ? each.value.event_filter : []
    content {
      include = event_filter.value.include

      dynamic "all" {
        for_each = event_filter.value.all != null ? event_filter.value.all : []
        content {
        }
      }
    }
  }

  dynamic "log_configuration" {
    for_each = each.value.log_configuration != null ? each.value.log_configuration : []
    content {

      dynamic "s3" {
        for_each = log_configuration.value.s3 != null ? log_configuration.value.s3 : []
        content {
          bucket           = s3.value.bucket
          folder_structure = s3.value.folder_structure
          log_file_format  = s3.value.log_file_format
          bucket_owner     = s3.value.bucket_owner
          key_prefix       = s3.value.key_prefix
        }
      }
    }
  }
}
