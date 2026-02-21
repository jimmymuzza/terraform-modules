resource "aws_keyspaces_keyspace" "keyspaces_keyspaces" {
  for_each = var.keyspaces_keyspaces

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "replication_specification" {
    for_each = each.value.replication_specification != null ? each.value.replication_specification : []
    content {
      region_list          = replication_specification.value.region_list
      replication_strategy = replication_specification.value.replication_strategy
    }
  }
}
