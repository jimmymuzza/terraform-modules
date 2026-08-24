resource "aws_networkfirewall_container_association" "networkfirewall_container_associations" {
  for_each = var.networkfirewall_container_associations

  container_association_name = each.value.container_association_name
  type                       = each.value.type
  description                = each.value.description
  region                     = each.value.region
  tags                       = each.value.tags

  dynamic "container_monitoring_configuration" {
    for_each = each.value.container_monitoring_configuration != null ? each.value.container_monitoring_configuration : []
    content {
      cluster_arn = container_monitoring_configuration.value.cluster_arn

      dynamic "attribute_filter" {
        for_each = container_monitoring_configuration.value.attribute_filter != null ? container_monitoring_configuration.value.attribute_filter : []
        content {
          key   = attribute_filter.value.key
          value = attribute_filter.value.value
        }
      }
    }
  }
}
