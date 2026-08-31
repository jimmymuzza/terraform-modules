resource "aws_securityhub_feature_v2" "securityhub_feature_v2s" {
  for_each = var.securityhub_feature_v2s

  feature_name   = each.value.feature_name
  feature_status = each.value.feature_status
  region         = each.value.region
}
