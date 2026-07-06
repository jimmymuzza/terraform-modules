resource "aws_kendra_query_suggestions_block_list" "kendra_query_suggestions_block_lists" {
  for_each = var.kendra_query_suggestions_block_lists

  index_id    = each.value.index_id
  name        = each.value.name
  role_arn    = each.value.role_arn
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "source_s3_path" {
    for_each = each.value.source_s3_path != null ? each.value.source_s3_path : []
    content {
      bucket = source_s3_path.value.bucket
      key    = source_s3_path.value.key
    }
  }
}
