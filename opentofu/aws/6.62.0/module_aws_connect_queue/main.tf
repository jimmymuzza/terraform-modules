resource "aws_connect_queue" "connect_queues" {
  for_each = var.connect_queues

  hours_of_operation_id = each.value.hours_of_operation_id
  instance_id           = each.value.instance_id
  name                  = each.value.name
  description           = each.value.description
  max_contacts          = each.value.max_contacts
  quick_connect_ids     = each.value.quick_connect_ids
  region                = each.value.region
  status                = each.value.status
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "outbound_caller_config" {
    for_each = each.value.outbound_caller_config != null ? each.value.outbound_caller_config : []
    content {
      outbound_caller_id_name      = outbound_caller_config.value.outbound_caller_id_name
      outbound_caller_id_number_id = outbound_caller_config.value.outbound_caller_id_number_id
      outbound_flow_id             = outbound_caller_config.value.outbound_flow_id
    }
  }
}
