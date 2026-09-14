resource "aws_lb_trust_store_revocation" "lb_trust_store_revocations" {
  for_each = var.lb_trust_store_revocations

  revocations_s3_bucket         = each.value.revocations_s3_bucket
  revocations_s3_key            = each.value.revocations_s3_key
  trust_store_arn               = each.value.trust_store_arn
  region                        = each.value.region
  revocations_s3_object_version = each.value.revocations_s3_object_version
}
