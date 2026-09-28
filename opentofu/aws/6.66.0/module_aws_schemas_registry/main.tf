resource "aws_schemas_registry" "schemas_registries" {
  for_each = var.schemas_registries

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
