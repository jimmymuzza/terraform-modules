resource "aws_s3files_file_system" "s3files_file_systems" {
  for_each = var.s3files_file_systems

  bucket     = each.value.bucket
  role_arn   = each.value.role_arn
  kms_key_id = each.value.kms_key_id
  prefix     = each.value.prefix
  region     = each.value.region
  tags       = each.value.tags
}
