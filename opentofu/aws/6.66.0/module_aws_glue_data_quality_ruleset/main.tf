resource "aws_glue_data_quality_ruleset" "glue_data_quality_rulesets" {
  for_each = var.glue_data_quality_rulesets

  name        = each.value.name
  ruleset     = each.value.ruleset
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "target_table" {
    for_each = each.value.target_table != null ? each.value.target_table : []
    content {
      database_name = target_table.value.database_name
      table_name    = target_table.value.table_name
      catalog_id    = target_table.value.catalog_id
    }
  }
}
