resource "aws_glue_schema" "glue_schemas" {
  for_each = var.glue_schemas

  compatibility     = each.value.compatibility
  data_format       = each.value.data_format
  schema_definition = each.value.schema_definition
  schema_name       = each.value.schema_name
  description       = each.value.description
  region            = each.value.region
  registry_arn      = each.value.registry_arn
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
