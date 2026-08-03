resource "aws_auditmanager_framework" "auditmanager_frameworks" {
  for_each = var.auditmanager_frameworks

  name            = each.value.name
  compliance_type = each.value.compliance_type
  description     = each.value.description
  region          = each.value.region
  tags            = each.value.tags

  dynamic "control_sets" {
    for_each = each.value.control_sets != null ? each.value.control_sets : []
    content {
      name = control_sets.value.name

      dynamic "controls" {
        for_each = control_sets.value.controls != null ? control_sets.value.controls : []
        content {
        }
      }
    }
  }
}
