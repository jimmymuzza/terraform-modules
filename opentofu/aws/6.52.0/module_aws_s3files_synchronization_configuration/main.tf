resource "aws_s3files_synchronization_configuration" "s3files_synchronization_configurations" {
  for_each = var.s3files_synchronization_configurations

  file_system_id        = each.value.file_system_id
  latest_version_number = each.value.latest_version_number
  region                = each.value.region

  dynamic "expiration_data_rule" {
    for_each = each.value.expiration_data_rule != null ? each.value.expiration_data_rule : []
    content {
      days_after_last_access = expiration_data_rule.value.days_after_last_access
    }
  }

  dynamic "import_data_rule" {
    for_each = each.value.import_data_rule != null ? each.value.import_data_rule : []
    content {
      prefix         = import_data_rule.value.prefix
      size_less_than = import_data_rule.value.size_less_than
      trigger        = import_data_rule.value.trigger
    }
  }
}
