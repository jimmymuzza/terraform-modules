resource "aws_codeconnections_host" "codeconnections_hosts" {
  for_each = var.codeconnections_hosts

  name              = each.value.name
  provider_endpoint = each.value.provider_endpoint
  provider_type     = each.value.provider_type
  region            = each.value.region
  tags              = each.value.tags

  dynamic "vpc_configuration" {
    for_each = each.value.vpc_configuration != null ? each.value.vpc_configuration : []
    content {
      security_group_ids = vpc_configuration.value.security_group_ids
      subnet_ids         = vpc_configuration.value.subnet_ids
      vpc_id             = vpc_configuration.value.vpc_id
      tls_certificate    = vpc_configuration.value.tls_certificate
    }
  }
}
