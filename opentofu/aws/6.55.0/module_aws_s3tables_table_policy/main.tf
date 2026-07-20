resource "aws_s3tables_table_policy" "s3tables_table_policies" {
  for_each = var.s3tables_table_policies

  name             = each.value.name
  namespace        = each.value.namespace
  resource_policy  = each.value.resource_policy
  table_bucket_arn = each.value.table_bucket_arn
  region           = each.value.region
}
