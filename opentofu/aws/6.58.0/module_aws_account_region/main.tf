resource "aws_account_region" "account_regions" {
  for_each = var.account_regions

  enabled     = each.value.enabled
  region_name = each.value.region_name
  account_id  = each.value.account_id
}
