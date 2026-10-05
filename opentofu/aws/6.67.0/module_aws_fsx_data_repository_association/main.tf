resource "aws_fsx_data_repository_association" "fsx_data_repository_associations" {
  for_each = var.fsx_data_repository_associations

  data_repository_path             = each.value.data_repository_path
  file_system_id                   = each.value.file_system_id
  file_system_path                 = each.value.file_system_path
  batch_import_meta_data_on_create = each.value.batch_import_meta_data_on_create
  delete_data_in_filesystem        = each.value.delete_data_in_filesystem
  imported_file_chunk_size         = each.value.imported_file_chunk_size
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all

  dynamic "s3" {
    for_each = each.value.s3 != null ? each.value.s3 : []
    content {

      dynamic "auto_export_policy" {
        for_each = s3.value.auto_export_policy != null ? s3.value.auto_export_policy : []
        content {
          events = auto_export_policy.value.events
        }
      }

      dynamic "auto_import_policy" {
        for_each = s3.value.auto_import_policy != null ? s3.value.auto_import_policy : []
        content {
          events = auto_import_policy.value.events
        }
      }
    }
  }
}
