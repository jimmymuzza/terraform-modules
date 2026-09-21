resource "aws_sfn_activity" "sfn_activities" {
  for_each = var.sfn_activities

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      kms_data_key_reuse_period_seconds = encryption_configuration.value.kms_data_key_reuse_period_seconds
      kms_key_id                        = encryption_configuration.value.kms_key_id
      type                              = encryption_configuration.value.type
    }
  }
}
