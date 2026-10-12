resource "aws_timestreamwrite_database" "timestreamwrite_databases" {
  for_each = var.timestreamwrite_databases

  database_name = each.value.database_name
  kms_key_id    = each.value.kms_key_id
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
