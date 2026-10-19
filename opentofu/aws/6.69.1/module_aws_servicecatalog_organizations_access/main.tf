resource "aws_servicecatalog_organizations_access" "servicecatalog_organizations_accesses" {
  for_each = var.servicecatalog_organizations_accesses

  enabled = each.value.enabled
}
