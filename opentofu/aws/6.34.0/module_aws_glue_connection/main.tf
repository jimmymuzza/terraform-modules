resource "aws_glue_connection" "glue_connections" {
  for_each = var.glue_connections

  name                  = each.value.name
  athena_properties     = each.value.athena_properties
  catalog_id            = each.value.catalog_id
  connection_properties = each.value.connection_properties
  connection_type       = each.value.connection_type
  description           = each.value.description
  match_criteria        = each.value.match_criteria
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "physical_connection_requirements" {
    for_each = each.value.physical_connection_requirements != null ? each.value.physical_connection_requirements : []
    content {
      availability_zone      = physical_connection_requirements.value.availability_zone
      security_group_id_list = physical_connection_requirements.value.security_group_id_list
      subnet_id              = physical_connection_requirements.value.subnet_id
    }
  }
}
