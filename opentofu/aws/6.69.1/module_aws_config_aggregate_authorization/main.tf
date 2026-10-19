resource "aws_config_aggregate_authorization" "config_aggregate_authorizations" {
  for_each = var.config_aggregate_authorizations

  account_id            = each.value.account_id
  authorized_aws_region = each.value.authorized_aws_region
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
}
