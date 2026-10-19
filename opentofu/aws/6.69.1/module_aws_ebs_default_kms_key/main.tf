resource "aws_ebs_default_kms_key" "ebs_default_kms_keys" {
  for_each = var.ebs_default_kms_keys

  key_arn = each.value.key_arn
  region  = each.value.region
}
