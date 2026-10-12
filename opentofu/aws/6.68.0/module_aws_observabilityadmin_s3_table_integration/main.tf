resource "aws_observabilityadmin_s3_table_integration" "observabilityadmin_s3_table_integrations" {
  for_each = var.observabilityadmin_s3_table_integrations

  role_arn = each.value.role_arn
  region   = each.value.region
  tags     = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      sse_algorithm = encryption.value.sse_algorithm
      kms_key_arn   = encryption.value.kms_key_arn
    }
  }
}
