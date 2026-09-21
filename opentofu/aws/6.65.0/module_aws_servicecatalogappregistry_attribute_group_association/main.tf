resource "aws_servicecatalogappregistry_attribute_group_association" "servicecatalogappregistry_attribute_group_associations" {
  for_each = var.servicecatalogappregistry_attribute_group_associations

  application_id     = each.value.application_id
  attribute_group_id = each.value.attribute_group_id
  region             = each.value.region
}
