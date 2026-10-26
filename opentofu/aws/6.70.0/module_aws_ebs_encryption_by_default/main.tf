resource "aws_ebs_encryption_by_default" "ebs_encryption_by_defaults" {
  for_each = var.ebs_encryption_by_defaults

  enabled = each.value.enabled
  region  = each.value.region
}
