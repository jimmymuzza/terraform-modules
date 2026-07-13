resource "aws_rds_export_task" "rds_export_tasks" {
  for_each = var.rds_export_tasks

  export_task_identifier = each.value.export_task_identifier
  iam_role_arn           = each.value.iam_role_arn
  kms_key_id             = each.value.kms_key_id
  s3_bucket_name         = each.value.s3_bucket_name
  source_arn             = each.value.source_arn
  export_only            = each.value.export_only
  region                 = each.value.region
  s3_prefix              = each.value.s3_prefix
}
