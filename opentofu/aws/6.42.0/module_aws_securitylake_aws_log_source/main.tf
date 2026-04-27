resource "aws_securitylake_aws_log_source" "securitylake_aws_log_sources" {
  for_each = var.securitylake_aws_log_sources

  region = each.value.region

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      regions        = source.value.regions
      source_name    = source.value.source_name
      accounts       = source.value.accounts
      source_version = source.value.source_version
    }
  }
}
