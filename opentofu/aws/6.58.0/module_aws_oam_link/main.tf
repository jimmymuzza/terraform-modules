resource "aws_oam_link" "oam_links" {
  for_each = var.oam_links

  label_template  = each.value.label_template
  resource_types  = each.value.resource_types
  sink_identifier = each.value.sink_identifier
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "link_configuration" {
    for_each = each.value.link_configuration != null ? each.value.link_configuration : []
    content {

      dynamic "log_group_configuration" {
        for_each = link_configuration.value.log_group_configuration != null ? link_configuration.value.log_group_configuration : []
        content {
          filter = log_group_configuration.value.filter
        }
      }

      dynamic "metric_configuration" {
        for_each = link_configuration.value.metric_configuration != null ? link_configuration.value.metric_configuration : []
        content {
          filter = metric_configuration.value.filter
        }
      }
    }
  }
}
