resource "aws_s3_directory_bucket" "s3_directory_buckets" {
  for_each = var.s3_directory_buckets

  bucket          = each.value.bucket
  data_redundancy = each.value.data_redundancy
  force_destroy   = each.value.force_destroy
  region          = each.value.region
  tags            = each.value.tags
  type            = each.value.type

  dynamic "location" {
    for_each = each.value.location != null ? each.value.location : []
    content {
      name = location.value.name
      type = location.value.type
    }
  }
}
