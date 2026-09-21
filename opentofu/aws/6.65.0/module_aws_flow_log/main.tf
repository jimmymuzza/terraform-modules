resource "aws_flow_log" "flow_logs" {
  for_each = var.flow_logs

  deliver_cross_account_role    = each.value.deliver_cross_account_role
  eni_id                        = each.value.eni_id
  iam_role_arn                  = each.value.iam_role_arn
  log_destination               = each.value.log_destination
  log_destination_type          = each.value.log_destination_type
  log_format                    = each.value.log_format
  max_aggregation_interval      = each.value.max_aggregation_interval
  region                        = each.value.region
  regional_nat_gateway_id       = each.value.regional_nat_gateway_id
  subnet_id                     = each.value.subnet_id
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  traffic_type                  = each.value.traffic_type
  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id
  transit_gateway_id            = each.value.transit_gateway_id
  vpc_id                        = each.value.vpc_id

  dynamic "destination_options" {
    for_each = each.value.destination_options != null ? each.value.destination_options : []
    content {
      file_format                = destination_options.value.file_format
      hive_compatible_partitions = destination_options.value.hive_compatible_partitions
      per_hour_partition         = destination_options.value.per_hour_partition
    }
  }

  dynamic "tag_field_specification" {
    for_each = each.value.tag_field_specification != null ? each.value.tag_field_specification : []
    content {
      resource_type = tag_field_specification.value.resource_type
      tag_keys      = tag_field_specification.value.tag_keys
    }
  }
}
