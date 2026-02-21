resource "aws_servicecatalogappregistry_attribute_group" "servicecatalogappregistry_attribute_groups" {
  for_each = var.servicecatalogappregistry_attribute_groups

  attributes  = each.value.attributes
  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
}
