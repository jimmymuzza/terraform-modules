resource "aws_rds_custom_db_engine_version" "rds_custom_db_engine_versions" {
  for_each = var.rds_custom_db_engine_versions

  engine                                     = each.value.engine
  engine_version                             = each.value.engine_version
  database_installation_files_s3_bucket_name = each.value.database_installation_files_s3_bucket_name
  database_installation_files_s3_prefix      = each.value.database_installation_files_s3_prefix
  description                                = each.value.description
  filename                                   = each.value.filename
  kms_key_id                                 = each.value.kms_key_id
  manifest                                   = each.value.manifest
  manifest_hash                              = each.value.manifest_hash
  region                                     = each.value.region
  source_image_id                            = each.value.source_image_id
  status                                     = each.value.status
  tags                                       = each.value.tags
  tags_all                                   = each.value.tags_all
}
