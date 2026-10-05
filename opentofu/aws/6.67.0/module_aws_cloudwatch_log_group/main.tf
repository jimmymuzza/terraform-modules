resource "aws_cloudwatch_log_group" "cloudwatch_log_groups" {
  for_each = var.cloudwatch_log_groups

  deletion_protection_enabled = each.value.deletion_protection_enabled
  kms_key_id                  = each.value.kms_key_id
  log_group_class             = each.value.log_group_class
  name                        = each.value.name
  name_prefix                 = each.value.name_prefix
  region                      = each.value.region
  retention_in_days           = each.value.retention_in_days
  skip_destroy                = each.value.skip_destroy
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
