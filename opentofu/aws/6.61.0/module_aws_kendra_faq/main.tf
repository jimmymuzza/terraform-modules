resource "aws_kendra_faq" "kendra_faqs" {
  for_each = var.kendra_faqs

  index_id      = each.value.index_id
  name          = each.value.name
  role_arn      = each.value.role_arn
  description   = each.value.description
  file_format   = each.value.file_format
  language_code = each.value.language_code
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "s3_path" {
    for_each = each.value.s3_path != null ? each.value.s3_path : []
    content {
      bucket = s3_path.value.bucket
      key    = s3_path.value.key
    }
  }
}
