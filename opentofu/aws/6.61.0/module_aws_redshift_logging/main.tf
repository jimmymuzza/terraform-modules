resource "aws_redshift_logging" "redshift_loggings" {
  for_each = var.redshift_loggings

  cluster_identifier   = each.value.cluster_identifier
  bucket_name          = each.value.bucket_name
  log_destination_type = each.value.log_destination_type
  log_exports          = each.value.log_exports
  region               = each.value.region
  s3_key_prefix        = each.value.s3_key_prefix
}
