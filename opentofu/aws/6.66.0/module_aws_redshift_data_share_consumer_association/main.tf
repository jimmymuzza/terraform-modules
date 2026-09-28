resource "aws_redshift_data_share_consumer_association" "redshift_data_share_consumer_associations" {
  for_each = var.redshift_data_share_consumer_associations

  data_share_arn           = each.value.data_share_arn
  allow_writes             = each.value.allow_writes
  associate_entire_account = each.value.associate_entire_account
  consumer_arn             = each.value.consumer_arn
  consumer_region          = each.value.consumer_region
  region                   = each.value.region
}
