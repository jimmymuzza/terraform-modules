resource "aws_macie2_findings_filter" "macie2_findings_filters" {
  for_each = var.macie2_findings_filters

  action      = each.value.action
  description = each.value.description
  name        = each.value.name
  name_prefix = each.value.name_prefix
  position    = each.value.position
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "finding_criteria" {
    for_each = each.value.finding_criteria != null ? each.value.finding_criteria : []
    content {

      dynamic "criterion" {
        for_each = finding_criteria.value.criterion != null ? finding_criteria.value.criterion : []
        content {
          field          = criterion.value.field
          eq             = criterion.value.eq
          eq_exact_match = criterion.value.eq_exact_match
          gt             = criterion.value.gt
          gte            = criterion.value.gte
          lt             = criterion.value.lt
          lte            = criterion.value.lte
          neq            = criterion.value.neq
        }
      }
    }
  }
}
