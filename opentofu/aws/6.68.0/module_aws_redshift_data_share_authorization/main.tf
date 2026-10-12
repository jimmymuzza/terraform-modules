resource "aws_redshift_data_share_authorization" "redshift_data_share_authorizations" {
  for_each = var.redshift_data_share_authorizations

  consumer_identifier = each.value.consumer_identifier
  data_share_arn      = each.value.data_share_arn
  allow_writes        = each.value.allow_writes
  region              = each.value.region
}
