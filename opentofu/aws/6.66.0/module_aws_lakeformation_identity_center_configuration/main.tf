resource "aws_lakeformation_identity_center_configuration" "lakeformation_identity_center_configurations" {
  for_each = var.lakeformation_identity_center_configurations

  instance_arn = each.value.instance_arn
  catalog_id   = each.value.catalog_id
  region       = each.value.region
}
