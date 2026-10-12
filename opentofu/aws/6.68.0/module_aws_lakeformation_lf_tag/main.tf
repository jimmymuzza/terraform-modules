resource "aws_lakeformation_lf_tag" "lakeformation_lf_tags" {
  for_each = var.lakeformation_lf_tags

  key        = each.value.key
  values     = each.value.values
  catalog_id = each.value.catalog_id
  region     = each.value.region
}
