resource "aws_db_proxy_target" "db_proxy_targets" {
  for_each = var.db_proxy_targets

  db_proxy_name          = each.value.db_proxy_name
  target_group_name      = each.value.target_group_name
  db_cluster_identifier  = each.value.db_cluster_identifier
  db_instance_identifier = each.value.db_instance_identifier
  region                 = each.value.region
}
