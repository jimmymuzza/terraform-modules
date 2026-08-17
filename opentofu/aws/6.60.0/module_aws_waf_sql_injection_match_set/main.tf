resource "aws_waf_sql_injection_match_set" "waf_sql_injection_match_sets" {
  for_each = var.waf_sql_injection_match_sets

  name = each.value.name

  dynamic "sql_injection_match_tuples" {
    for_each = each.value.sql_injection_match_tuples != null ? each.value.sql_injection_match_tuples : []
    content {
      text_transformation = sql_injection_match_tuples.value.text_transformation

      dynamic "field_to_match" {
        for_each = sql_injection_match_tuples.value.field_to_match != null ? sql_injection_match_tuples.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
