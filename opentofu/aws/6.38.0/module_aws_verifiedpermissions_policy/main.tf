resource "aws_verifiedpermissions_policy" "verifiedpermissions_policies" {
  for_each = var.verifiedpermissions_policies

  policy_store_id = each.value.policy_store_id
  region          = each.value.region

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {

      dynamic "static" {
        for_each = definition.value.static != null ? definition.value.static : []
        content {
          statement   = static.value.statement
          description = static.value.description
        }
      }

      dynamic "template_linked" {
        for_each = definition.value.template_linked != null ? definition.value.template_linked : []
        content {
          policy_template_id = template_linked.value.policy_template_id

          dynamic "principal" {
            for_each = template_linked.value.principal != null ? template_linked.value.principal : []
            content {
              entity_id   = principal.value.entity_id
              entity_type = principal.value.entity_type
            }
          }

          dynamic "resource" {
            for_each = template_linked.value.resource != null ? template_linked.value.resource : []
            content {
              entity_id   = resource.value.entity_id
              entity_type = resource.value.entity_type
            }
          }
        }
      }
    }
  }
}
