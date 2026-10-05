resource "aws_lb_trust_store" "lb_trust_stores" {
  for_each = var.lb_trust_stores

  ca_certificates_bundle_s3_bucket         = each.value.ca_certificates_bundle_s3_bucket
  ca_certificates_bundle_s3_key            = each.value.ca_certificates_bundle_s3_key
  ca_certificates_bundle_s3_object_version = each.value.ca_certificates_bundle_s3_object_version
  name                                     = each.value.name
  name_prefix                              = each.value.name_prefix
  region                                   = each.value.region
  tags                                     = each.value.tags
  tags_all                                 = each.value.tags_all
}
