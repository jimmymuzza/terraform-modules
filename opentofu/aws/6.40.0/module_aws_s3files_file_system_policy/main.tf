resource "aws_s3files_file_system_policy" "s3files_file_system_policies" {
  for_each = var.s3files_file_system_policies

  file_system_id = each.value.file_system_id
  policy         = each.value.policy
  region         = each.value.region
}
