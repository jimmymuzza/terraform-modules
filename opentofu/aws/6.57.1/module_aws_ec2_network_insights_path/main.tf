resource "aws_ec2_network_insights_path" "ec2_network_insights_paths" {
  for_each = var.ec2_network_insights_paths

  protocol         = each.value.protocol
  source           = each.value.source
  destination      = each.value.destination
  destination_ip   = each.value.destination_ip
  destination_port = each.value.destination_port
  region           = each.value.region
  source_ip        = each.value.source_ip
  tags             = each.value.tags
  tags_all         = each.value.tags_all

  dynamic "filter_at_destination" {
    for_each = each.value.filter_at_destination != null ? each.value.filter_at_destination : []
    content {
      destination_address = filter_at_destination.value.destination_address
      source_address      = filter_at_destination.value.source_address

      dynamic "destination_port_range" {
        for_each = filter_at_destination.value.destination_port_range != null ? filter_at_destination.value.destination_port_range : []
        content {
          from_port = destination_port_range.value.from_port
          to_port   = destination_port_range.value.to_port
        }
      }

      dynamic "source_port_range" {
        for_each = filter_at_destination.value.source_port_range != null ? filter_at_destination.value.source_port_range : []
        content {
          from_port = source_port_range.value.from_port
          to_port   = source_port_range.value.to_port
        }
      }
    }
  }

  dynamic "filter_at_source" {
    for_each = each.value.filter_at_source != null ? each.value.filter_at_source : []
    content {
      destination_address = filter_at_source.value.destination_address
      source_address      = filter_at_source.value.source_address

      dynamic "destination_port_range" {
        for_each = filter_at_source.value.destination_port_range != null ? filter_at_source.value.destination_port_range : []
        content {
          from_port = destination_port_range.value.from_port
          to_port   = destination_port_range.value.to_port
        }
      }

      dynamic "source_port_range" {
        for_each = filter_at_source.value.source_port_range != null ? filter_at_source.value.source_port_range : []
        content {
          from_port = source_port_range.value.from_port
          to_port   = source_port_range.value.to_port
        }
      }
    }
  }
}
