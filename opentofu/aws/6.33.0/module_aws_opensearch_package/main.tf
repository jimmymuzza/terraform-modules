resource "aws_opensearch_package" "opensearch_packages" {
  for_each = var.opensearch_packages

  package_name        = each.value.package_name
  package_type        = each.value.package_type
  engine_version      = each.value.engine_version
  package_description = each.value.package_description
  region              = each.value.region

  dynamic "package_source" {
    for_each = each.value.package_source != null ? each.value.package_source : []
    content {
      s3_bucket_name = package_source.value.s3_bucket_name
      s3_key         = package_source.value.s3_key
    }
  }
}
