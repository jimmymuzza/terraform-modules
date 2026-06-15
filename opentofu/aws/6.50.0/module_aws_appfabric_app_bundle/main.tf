resource "aws_appfabric_app_bundle" "appfabric_app_bundles" {
  for_each = var.appfabric_app_bundles

  customer_managed_key_arn = each.value.customer_managed_key_arn
  region                   = each.value.region
  tags                     = each.value.tags
}
