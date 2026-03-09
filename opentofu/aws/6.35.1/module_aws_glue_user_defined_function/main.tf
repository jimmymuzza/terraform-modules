resource "aws_glue_user_defined_function" "glue_user_defined_functions" {
  for_each = var.glue_user_defined_functions

  class_name    = each.value.class_name
  database_name = each.value.database_name
  name          = each.value.name
  owner_name    = each.value.owner_name
  owner_type    = each.value.owner_type
  catalog_id    = each.value.catalog_id
  region        = each.value.region

  dynamic "resource_uris" {
    for_each = each.value.resource_uris != null ? each.value.resource_uris : []
    content {
      resource_type = resource_uris.value.resource_type
      uri           = resource_uris.value.uri
    }
  }
}
