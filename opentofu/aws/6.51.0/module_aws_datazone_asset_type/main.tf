resource "aws_datazone_asset_type" "datazone_asset_types" {
  for_each = var.datazone_asset_types

  domain_identifier         = each.value.domain_identifier
  name                      = each.value.name
  owning_project_identifier = each.value.owning_project_identifier
  description               = each.value.description
  region                    = each.value.region

  dynamic "forms_input" {
    for_each = each.value.forms_input != null ? each.value.forms_input : []
    content {
      map_block_key   = forms_input.value.map_block_key
      type_identifier = forms_input.value.type_identifier
      type_revision   = forms_input.value.type_revision
      required        = forms_input.value.required
    }
  }
}
