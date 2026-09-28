resource "aws_servicecatalog_tag_option_resource_association" "servicecatalog_tag_option_resource_associations" {
  for_each = var.servicecatalog_tag_option_resource_associations

  resource_id   = each.value.resource_id
  tag_option_id = each.value.tag_option_id
  region        = each.value.region
}
