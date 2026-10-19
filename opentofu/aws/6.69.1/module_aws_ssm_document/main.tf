resource "aws_ssm_document" "ssm_documents" {
  for_each = var.ssm_documents

  content         = each.value.content
  document_type   = each.value.document_type
  name            = each.value.name
  document_format = each.value.document_format
  permissions     = each.value.permissions
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
  target_type     = each.value.target_type
  version_name    = each.value.version_name

  dynamic "attachments_source" {
    for_each = each.value.attachments_source != null ? each.value.attachments_source : []
    content {
      key    = attachments_source.value.key
      values = attachments_source.value.values
      name   = attachments_source.value.name
    }
  }
}
