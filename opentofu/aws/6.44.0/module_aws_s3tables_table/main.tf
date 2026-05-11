resource "aws_s3tables_table" "s3tables_tables" {
  for_each = var.s3tables_tables

  format                    = each.value.format
  name                      = each.value.name
  namespace                 = each.value.namespace
  table_bucket_arn          = each.value.table_bucket_arn
  encryption_configuration  = each.value.encryption_configuration
  maintenance_configuration = each.value.maintenance_configuration
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {

      dynamic "iceberg" {
        for_each = metadata.value.iceberg != null ? metadata.value.iceberg : []
        content {

          dynamic "schema" {
            for_each = iceberg.value.schema != null ? iceberg.value.schema : []
            content {

              dynamic "field" {
                for_each = schema.value.field != null ? schema.value.field : []
                content {
                  name     = field.value.name
                  type     = field.value.type
                  required = field.value.required
                }
              }
            }
          }
        }
      }
    }
  }
}
