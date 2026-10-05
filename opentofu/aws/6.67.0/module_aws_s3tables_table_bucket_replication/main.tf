resource "aws_s3tables_table_bucket_replication" "s3tables_table_bucket_replications" {
  for_each = var.s3tables_table_bucket_replications

  role             = each.value.role
  table_bucket_arn = each.value.table_bucket_arn
  region           = each.value.region

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {

      dynamic "destination" {
        for_each = rule.value.destination != null ? rule.value.destination : []
        content {
          destination_table_bucket_arn = destination.value.destination_table_bucket_arn
        }
      }
    }
  }
}
