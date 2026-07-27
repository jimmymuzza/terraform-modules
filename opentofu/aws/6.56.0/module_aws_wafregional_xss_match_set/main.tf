resource "aws_wafregional_xss_match_set" "wafregional_xss_match_sets" {
  for_each = var.wafregional_xss_match_sets

  name   = each.value.name
  region = each.value.region

  dynamic "xss_match_tuple" {
    for_each = each.value.xss_match_tuple != null ? each.value.xss_match_tuple : []
    content {
      text_transformation = xss_match_tuple.value.text_transformation

      dynamic "field_to_match" {
        for_each = xss_match_tuple.value.field_to_match != null ? xss_match_tuple.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
