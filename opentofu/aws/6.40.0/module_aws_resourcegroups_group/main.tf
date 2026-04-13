resource "aws_resourcegroups_group" "resourcegroups_groups" {
  for_each = var.resourcegroups_groups

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      type = configuration.value.type

      dynamic "parameters" {
        for_each = configuration.value.parameters != null ? configuration.value.parameters : []
        content {
          name   = parameters.value.name
          values = parameters.value.values
        }
      }
    }
  }

  dynamic "resource_query" {
    for_each = each.value.resource_query != null ? each.value.resource_query : []
    content {
      query = resource_query.value.query
      type  = resource_query.value.type
    }
  }
}
