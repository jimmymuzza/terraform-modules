resource "aws_wafregional_sql_injection_match_set" "wafregional_sql_injection_match_sets" {
  for_each = var.wafregional_sql_injection_match_sets

  name   = each.value.name
  region = each.value.region

  dynamic "sql_injection_match_tuple" {
    for_each = each.value.sql_injection_match_tuple != null ? each.value.sql_injection_match_tuple : []
    content {
      text_transformation = sql_injection_match_tuple.value.text_transformation

      dynamic "field_to_match" {
        for_each = sql_injection_match_tuple.value.field_to_match != null ? sql_injection_match_tuple.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
