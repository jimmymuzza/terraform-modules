resource "aws_rds_integration" "rds_integrations" {
  for_each = var.rds_integrations

  integration_name              = each.value.integration_name
  source_arn                    = each.value.source_arn
  target_arn                    = each.value.target_arn
  additional_encryption_context = each.value.additional_encryption_context
  data_filter                   = each.value.data_filter
  kms_key_id                    = each.value.kms_key_id
  region                        = each.value.region
  tags                          = each.value.tags
}
