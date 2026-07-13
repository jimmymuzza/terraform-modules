resource "aws_s3tables_namespace" "s3tables_namespaces" {
  for_each = var.s3tables_namespaces

  namespace        = each.value.namespace
  table_bucket_arn = each.value.table_bucket_arn
  region           = each.value.region
}
