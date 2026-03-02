resource "aws_lakeformation_lf_tag_expression" "lakeformation_lf_tag_expressions" {
  for_each = var.lakeformation_lf_tag_expressions

  name        = each.value.name
  catalog_id  = each.value.catalog_id
  description = each.value.description
  region      = each.value.region

  dynamic "expression" {
    for_each = each.value.expression != null ? each.value.expression : []
    content {
      tag_key    = expression.value.tag_key
      tag_values = expression.value.tag_values
    }
  }
}
