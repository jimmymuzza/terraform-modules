resource "aws_servicecatalog_service_action" "servicecatalog_service_actions" {
  for_each = var.servicecatalog_service_actions

  name            = each.value.name
  accept_language = each.value.accept_language
  description     = each.value.description
  region          = each.value.region

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {
      name        = definition.value.name
      version     = definition.value.version
      assume_role = definition.value.assume_role
      parameters  = definition.value.parameters
      type        = definition.value.type
    }
  }
}
