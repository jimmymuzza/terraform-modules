resource "aws_resourceexplorer2_view" "resourceexplorer2_views" {
  for_each = var.resourceexplorer2_views

  name         = each.value.name
  default_view = each.value.default_view
  region       = each.value.region
  scope        = each.value.scope
  tags         = each.value.tags

  dynamic "filters" {
    for_each = each.value.filters != null ? each.value.filters : []
    content {
      filter_string = filters.value.filter_string
    }
  }

  dynamic "included_property" {
    for_each = each.value.included_property != null ? each.value.included_property : []
    content {
      name = included_property.value.name
    }
  }
}
