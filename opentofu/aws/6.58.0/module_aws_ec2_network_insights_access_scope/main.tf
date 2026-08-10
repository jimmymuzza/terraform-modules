resource "aws_ec2_network_insights_access_scope" "ec2_network_insights_access_scopes" {
  for_each = var.ec2_network_insights_access_scopes

  region = each.value.region
  tags   = each.value.tags

  dynamic "exclude_paths" {
    for_each = each.value.exclude_paths != null ? each.value.exclude_paths : []
    content {

      dynamic "destination" {
        for_each = exclude_paths.value.destination != null ? exclude_paths.value.destination : []
        content {

          dynamic "packet_header_statement" {
            for_each = destination.value.packet_header_statement != null ? destination.value.packet_header_statement : []
            content {
              destination_addresses    = packet_header_statement.value.destination_addresses
              destination_ports        = packet_header_statement.value.destination_ports
              destination_prefix_lists = packet_header_statement.value.destination_prefix_lists
              protocols                = packet_header_statement.value.protocols
              source_addresses         = packet_header_statement.value.source_addresses
              source_ports             = packet_header_statement.value.source_ports
              source_prefix_lists      = packet_header_statement.value.source_prefix_lists
            }
          }

          dynamic "resource_statement" {
            for_each = destination.value.resource_statement != null ? destination.value.resource_statement : []
            content {
              resource_types = resource_statement.value.resource_types
              resources      = resource_statement.value.resources
            }
          }
        }
      }

      dynamic "source" {
        for_each = exclude_paths.value.source != null ? exclude_paths.value.source : []
        content {

          dynamic "packet_header_statement" {
            for_each = source.value.packet_header_statement != null ? source.value.packet_header_statement : []
            content {
              destination_addresses    = packet_header_statement.value.destination_addresses
              destination_ports        = packet_header_statement.value.destination_ports
              destination_prefix_lists = packet_header_statement.value.destination_prefix_lists
              protocols                = packet_header_statement.value.protocols
              source_addresses         = packet_header_statement.value.source_addresses
              source_ports             = packet_header_statement.value.source_ports
              source_prefix_lists      = packet_header_statement.value.source_prefix_lists
            }
          }

          dynamic "resource_statement" {
            for_each = source.value.resource_statement != null ? source.value.resource_statement : []
            content {
              resource_types = resource_statement.value.resource_types
              resources      = resource_statement.value.resources
            }
          }
        }
      }

      dynamic "through_resources" {
        for_each = exclude_paths.value.through_resources != null ? exclude_paths.value.through_resources : []
        content {

          dynamic "resource_statement" {
            for_each = through_resources.value.resource_statement != null ? through_resources.value.resource_statement : []
            content {
              resource_types = resource_statement.value.resource_types
              resources      = resource_statement.value.resources
            }
          }
        }
      }
    }
  }

  dynamic "match_paths" {
    for_each = each.value.match_paths != null ? each.value.match_paths : []
    content {

      dynamic "destination" {
        for_each = match_paths.value.destination != null ? match_paths.value.destination : []
        content {

          dynamic "packet_header_statement" {
            for_each = destination.value.packet_header_statement != null ? destination.value.packet_header_statement : []
            content {
              destination_addresses    = packet_header_statement.value.destination_addresses
              destination_ports        = packet_header_statement.value.destination_ports
              destination_prefix_lists = packet_header_statement.value.destination_prefix_lists
              protocols                = packet_header_statement.value.protocols
              source_addresses         = packet_header_statement.value.source_addresses
              source_ports             = packet_header_statement.value.source_ports
              source_prefix_lists      = packet_header_statement.value.source_prefix_lists
            }
          }

          dynamic "resource_statement" {
            for_each = destination.value.resource_statement != null ? destination.value.resource_statement : []
            content {
              resource_types = resource_statement.value.resource_types
              resources      = resource_statement.value.resources
            }
          }
        }
      }

      dynamic "source" {
        for_each = match_paths.value.source != null ? match_paths.value.source : []
        content {

          dynamic "packet_header_statement" {
            for_each = source.value.packet_header_statement != null ? source.value.packet_header_statement : []
            content {
              destination_addresses    = packet_header_statement.value.destination_addresses
              destination_ports        = packet_header_statement.value.destination_ports
              destination_prefix_lists = packet_header_statement.value.destination_prefix_lists
              protocols                = packet_header_statement.value.protocols
              source_addresses         = packet_header_statement.value.source_addresses
              source_ports             = packet_header_statement.value.source_ports
              source_prefix_lists      = packet_header_statement.value.source_prefix_lists
            }
          }

          dynamic "resource_statement" {
            for_each = source.value.resource_statement != null ? source.value.resource_statement : []
            content {
              resource_types = resource_statement.value.resource_types
              resources      = resource_statement.value.resources
            }
          }
        }
      }
    }
  }
}
