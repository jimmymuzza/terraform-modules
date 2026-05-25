resource "aws_waf_geo_match_set" "waf_geo_match_sets" {
  for_each = var.waf_geo_match_sets

  name = each.value.name

  dynamic "geo_match_constraint" {
    for_each = each.value.geo_match_constraint != null ? each.value.geo_match_constraint : []
    content {
      type  = geo_match_constraint.value.type
      value = geo_match_constraint.value.value
    }
  }
}
