resource "aws_s3vectors_vector_bucket" "s3vectors_vector_buckets" {
  for_each = var.s3vectors_vector_buckets

  vector_bucket_name       = each.value.vector_bucket_name
  encryption_configuration = each.value.encryption_configuration
  force_destroy            = each.value.force_destroy
  region                   = each.value.region
  tags                     = each.value.tags
}
