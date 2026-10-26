resource "aws_accessanalyzer_archive_rule" "accessanalyzer_archive_rules" {
  for_each = var.accessanalyzer_archive_rules

  analyzer_name = each.value.analyzer_name
  rule_name     = each.value.rule_name
  region        = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      criteria = filter.value.criteria
      contains = filter.value.contains
      eq       = filter.value.eq
      exists   = filter.value.exists
      neq      = filter.value.neq
    }
  }
}
