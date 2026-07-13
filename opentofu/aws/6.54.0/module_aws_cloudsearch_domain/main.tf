resource "aws_cloudsearch_domain" "cloudsearch_domains" {
  for_each = var.cloudsearch_domains

  name     = each.value.name
  multi_az = each.value.multi_az
  region   = each.value.region

  dynamic "endpoint_options" {
    for_each = each.value.endpoint_options != null ? each.value.endpoint_options : []
    content {
      enforce_https       = endpoint_options.value.enforce_https
      tls_security_policy = endpoint_options.value.tls_security_policy
    }
  }

  dynamic "index_field" {
    for_each = each.value.index_field != null ? each.value.index_field : []
    content {
      name            = index_field.value.name
      type            = index_field.value.type
      analysis_scheme = index_field.value.analysis_scheme
      default_value   = index_field.value.default_value
      facet           = index_field.value.facet
      highlight       = index_field.value.highlight
      return          = index_field.value.return
      search          = index_field.value.search
      sort            = index_field.value.sort
      source_fields   = index_field.value.source_fields
    }
  }

  dynamic "scaling_parameters" {
    for_each = each.value.scaling_parameters != null ? each.value.scaling_parameters : []
    content {
      desired_instance_type     = scaling_parameters.value.desired_instance_type
      desired_partition_count   = scaling_parameters.value.desired_partition_count
      desired_replication_count = scaling_parameters.value.desired_replication_count
    }
  }
}
