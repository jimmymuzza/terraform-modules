resource "aws_datazone_form_type" "datazone_form_types" {
  for_each = var.datazone_form_types

  domain_identifier         = each.value.domain_identifier
  name                      = each.value.name
  owning_project_identifier = each.value.owning_project_identifier
  description               = each.value.description
  region                    = each.value.region
  status                    = each.value.status

  dynamic "model" {
    for_each = each.value.model != null ? each.value.model : []
    content {
      smithy = model.value.smithy
    }
  }
}
