resource "aws_appconfig_extension" "appconfig_extensions" {
  for_each = var.appconfig_extensions

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "action_point" {
    for_each = each.value.action_point != null ? each.value.action_point : []
    content {
      point = action_point.value.point

      dynamic "action" {
        for_each = action_point.value.action != null ? action_point.value.action : []
        content {
          name        = action.value.name
          uri         = action.value.uri
          description = action.value.description
          role_arn    = action.value.role_arn
        }
      }
    }
  }

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      name        = parameter.value.name
      description = parameter.value.description
      required    = parameter.value.required
    }
  }
}
