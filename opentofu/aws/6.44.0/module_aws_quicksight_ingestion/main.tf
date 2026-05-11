resource "aws_quicksight_ingestion" "quicksight_ingestions" {
  for_each = var.quicksight_ingestions

  data_set_id    = each.value.data_set_id
  ingestion_id   = each.value.ingestion_id
  ingestion_type = each.value.ingestion_type
  aws_account_id = each.value.aws_account_id
  region         = each.value.region
}
