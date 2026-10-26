resource "aws_cloudwatchomni_access_grant" "cloudwatchomni_access_grants" {
  for_each = var.cloudwatchomni_access_grants

  domain_id  = each.value.domain_id
  name       = each.value.name
  permission = each.value.permission
  space_id   = each.value.space_id
  region     = each.value.region
  tags       = each.value.tags

  dynamic "principal" {
    for_each = each.value.principal != null ? each.value.principal : []
    content {
      principal_type = principal.value.principal_type
      principal_id   = principal.value.principal_id

      dynamic "principal_attribute" {
        for_each = principal.value.principal_attribute != null ? principal.value.principal_attribute : []
        content {
          key   = principal_attribute.value.key
          value = principal_attribute.value.value
        }
      }
    }
  }

  dynamic "scoped_action" {
    for_each = each.value.scoped_action != null ? each.value.scoped_action : []
    content {
      actions = scoped_action.value.actions

      dynamic "resource" {
        for_each = scoped_action.value.resource != null ? scoped_action.value.resource : []
        content {
          resource_type = resource.value.resource_type
          resource_arns = resource.value.resource_arns
          signal_types  = resource.value.signal_types
          tags          = resource.value.tags

          dynamic "row_scope_group" {
            for_each = resource.value.row_scope_group != null ? resource.value.row_scope_group : []
            content {

              dynamic "row_scope" {
                for_each = row_scope_group.value.row_scope != null ? row_scope_group.value.row_scope : []
                content {
                  field    = row_scope.value.field
                  operator = row_scope.value.operator
                  values   = row_scope.value.values
                }
              }
            }
          }
        }
      }
    }
  }
}
