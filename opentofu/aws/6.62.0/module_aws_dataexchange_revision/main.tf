resource "aws_dataexchange_revision" "dataexchange_revisions" {
  for_each = var.dataexchange_revisions

  data_set_id = each.value.data_set_id
  comment     = each.value.comment
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
