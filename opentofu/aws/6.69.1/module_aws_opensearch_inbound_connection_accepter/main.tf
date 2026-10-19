resource "aws_opensearch_inbound_connection_accepter" "opensearch_inbound_connection_accepters" {
  for_each = var.opensearch_inbound_connection_accepters

  connection_id = each.value.connection_id
  region        = each.value.region
}
