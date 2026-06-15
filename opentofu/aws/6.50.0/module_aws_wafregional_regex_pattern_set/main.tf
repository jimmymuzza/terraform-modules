resource "aws_wafregional_regex_pattern_set" "wafregional_regex_pattern_sets" {
  for_each = var.wafregional_regex_pattern_sets

  name                  = each.value.name
  regex_pattern_strings = each.value.regex_pattern_strings
  region                = each.value.region
}
