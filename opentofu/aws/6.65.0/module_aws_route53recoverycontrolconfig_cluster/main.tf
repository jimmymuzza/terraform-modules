resource "aws_route53recoverycontrolconfig_cluster" "route53recoverycontrolconfig_clusters" {
  for_each = var.route53recoverycontrolconfig_clusters

  name         = each.value.name
  network_type = each.value.network_type
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
