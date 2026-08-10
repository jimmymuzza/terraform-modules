resource "aws_servicecatalogappregistry_application" "servicecatalogappregistry_applications" {
  for_each = var.servicecatalogappregistry_applications

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
}
