resource "aws_redshift_integration" "redshift_integrations" {
  for_each = var.redshift_integrations

  integration_name              = each.value.integration_name
  source_arn                    = each.value.source_arn
  target_arn                    = each.value.target_arn
  additional_encryption_context = each.value.additional_encryption_context
  description                   = each.value.description
  kms_key_id                    = each.value.kms_key_id
  region                        = each.value.region
  tags                          = each.value.tags
}
