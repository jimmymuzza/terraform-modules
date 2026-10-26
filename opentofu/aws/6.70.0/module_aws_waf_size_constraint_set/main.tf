resource "aws_waf_size_constraint_set" "waf_size_constraint_sets" {
  for_each = var.waf_size_constraint_sets

  name = each.value.name

  dynamic "size_constraints" {
    for_each = each.value.size_constraints != null ? each.value.size_constraints : []
    content {
      comparison_operator = size_constraints.value.comparison_operator
      size                = size_constraints.value.size
      text_transformation = size_constraints.value.text_transformation

      dynamic "field_to_match" {
        for_each = size_constraints.value.field_to_match != null ? size_constraints.value.field_to_match : []
        content {
          type = field_to_match.value.type
          data = field_to_match.value.data
        }
      }
    }
  }
}
