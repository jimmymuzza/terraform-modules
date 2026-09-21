resource "aws_waf_regex_match_set" "waf_regex_match_sets" {
  for_each = var.waf_regex_match_sets

  name = each.value.name

  dynamic "regex_match_tuple" {
    for_each = each.value.regex_match_tuple != null ? each.value.regex_match_tuple : []
    content {
      regex_pattern_set_id = regex_match_tuple.value.regex_pattern_set_id
      text_transformation  = regex_match_tuple.value.text_transformation

      dynamic "field_to_match" {
        for_each = regex_match_tuple.value.field_to_match != null ? regex_match_tuple.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
