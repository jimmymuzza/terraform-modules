resource "aws_servicecatalog_budget_resource_association" "servicecatalog_budget_resource_associations" {
  for_each = var.servicecatalog_budget_resource_associations

  budget_name = each.value.budget_name
  resource_id = each.value.resource_id
  region      = each.value.region
}
