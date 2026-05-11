resource "aws_wafregional_byte_match_set" "wafregional_byte_match_sets" {
  for_each = var.wafregional_byte_match_sets

  name   = each.value.name
  region = each.value.region

  dynamic "byte_match_tuples" {
    for_each = each.value.byte_match_tuples != null ? each.value.byte_match_tuples : []
    content {
      positional_constraint = byte_match_tuples.value.positional_constraint
      text_transformation   = byte_match_tuples.value.text_transformation
      target_string         = byte_match_tuples.value.target_string

      dynamic "field_to_match" {
        for_each = byte_match_tuples.value.field_to_match != null ? byte_match_tuples.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
