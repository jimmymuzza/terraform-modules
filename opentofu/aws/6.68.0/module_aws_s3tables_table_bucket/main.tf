resource "aws_s3tables_table_bucket" "s3tables_table_buckets" {
  for_each = var.s3tables_table_buckets

  name                      = each.value.name
  encryption_configuration  = each.value.encryption_configuration
  force_destroy             = each.value.force_destroy
  maintenance_configuration = each.value.maintenance_configuration
  region                    = each.value.region
  tags                      = each.value.tags
}
