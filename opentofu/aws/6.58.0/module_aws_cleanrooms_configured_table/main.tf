resource "aws_cleanrooms_configured_table" "cleanrooms_configured_tables" {
  for_each = var.cleanrooms_configured_tables

  allowed_columns = each.value.allowed_columns
  analysis_method = each.value.analysis_method
  name            = each.value.name
  description     = each.value.description
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "table_reference" {
    for_each = each.value.table_reference != null ? each.value.table_reference : []
    content {
      database_name = table_reference.value.database_name
      table_name    = table_reference.value.table_name
    }
  }
}
