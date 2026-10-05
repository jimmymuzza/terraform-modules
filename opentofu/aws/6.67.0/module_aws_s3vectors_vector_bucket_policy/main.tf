resource "aws_s3vectors_vector_bucket_policy" "s3vectors_vector_bucket_policies" {
  for_each = var.s3vectors_vector_bucket_policies

  policy            = each.value.policy
  vector_bucket_arn = each.value.vector_bucket_arn
  region            = each.value.region
}
