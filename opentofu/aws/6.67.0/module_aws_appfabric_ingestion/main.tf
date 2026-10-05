resource "aws_appfabric_ingestion" "appfabric_ingestions" {
  for_each = var.appfabric_ingestions

  app            = each.value.app
  app_bundle_arn = each.value.app_bundle_arn
  ingestion_type = each.value.ingestion_type
  tenant_id      = each.value.tenant_id
  region         = each.value.region
  tags           = each.value.tags
}
