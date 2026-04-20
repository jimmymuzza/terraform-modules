resource "aws_waf_regex_pattern_set" "waf_regex_pattern_sets" {
  for_each = var.waf_regex_pattern_sets

  name                  = each.value.name
  regex_pattern_strings = each.value.regex_pattern_strings
}
