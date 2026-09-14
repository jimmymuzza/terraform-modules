resource "aws_athena_data_catalog" "athena_data_catalogs" {
  for_each = var.athena_data_catalogs

  description = each.value.description
  name        = each.value.name
  parameters  = each.value.parameters
  type        = each.value.type
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
