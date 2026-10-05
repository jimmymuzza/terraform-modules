resource "aws_opensearch_outbound_connection" "opensearch_outbound_connections" {
  for_each = var.opensearch_outbound_connections

  connection_alias  = each.value.connection_alias
  accept_connection = each.value.accept_connection
  connection_mode   = each.value.connection_mode
  region            = each.value.region

  dynamic "connection_properties" {
    for_each = each.value.connection_properties != null ? each.value.connection_properties : []
    content {

      dynamic "cross_cluster_search" {
        for_each = connection_properties.value.cross_cluster_search != null ? connection_properties.value.cross_cluster_search : []
        content {
          skip_unavailable = cross_cluster_search.value.skip_unavailable
        }
      }
    }
  }

  dynamic "local_domain_info" {
    for_each = each.value.local_domain_info != null ? each.value.local_domain_info : []
    content {
      domain_name = local_domain_info.value.domain_name
      owner_id    = local_domain_info.value.owner_id
      region      = local_domain_info.value.region
    }
  }

  dynamic "remote_domain_info" {
    for_each = each.value.remote_domain_info != null ? each.value.remote_domain_info : []
    content {
      domain_name = remote_domain_info.value.domain_name
      owner_id    = remote_domain_info.value.owner_id
      region      = remote_domain_info.value.region
    }
  }
}
