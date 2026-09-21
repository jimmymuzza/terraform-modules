resource "aws_s3tables_table_bucket_policy" "s3tables_table_bucket_policies" {
  for_each = var.s3tables_table_bucket_policies

  resource_policy  = each.value.resource_policy
  table_bucket_arn = each.value.table_bucket_arn
  region           = each.value.region
}
