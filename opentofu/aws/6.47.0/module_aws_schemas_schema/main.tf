resource "aws_schemas_schema" "schemas_schemas" {
  for_each = var.schemas_schemas

  content       = each.value.content
  name          = each.value.name
  registry_name = each.value.registry_name
  type          = each.value.type
  description   = each.value.description
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
