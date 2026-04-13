resource "aws_networkfirewall_tls_inspection_configuration" "networkfirewall_tls_inspection_configurations" {
  for_each = var.networkfirewall_tls_inspection_configurations

  name                     = each.value.name
  description              = each.value.description
  encryption_configuration = each.value.encryption_configuration
  region                   = each.value.region
  tags                     = each.value.tags

  dynamic "tls_inspection_configuration" {
    for_each = each.value.tls_inspection_configuration != null ? each.value.tls_inspection_configuration : []
    content {

      dynamic "server_certificate_configuration" {
        for_each = tls_inspection_configuration.value.server_certificate_configuration != null ? tls_inspection_configuration.value.server_certificate_configuration : []
        content {
          certificate_authority_arn = server_certificate_configuration.value.certificate_authority_arn

          dynamic "check_certificate_revocation_status" {
            for_each = server_certificate_configuration.value.check_certificate_revocation_status != null ? server_certificate_configuration.value.check_certificate_revocation_status : []
            content {
              revoked_status_action = check_certificate_revocation_status.value.revoked_status_action
              unknown_status_action = check_certificate_revocation_status.value.unknown_status_action
            }
          }

          dynamic "scope" {
            for_each = server_certificate_configuration.value.scope != null ? server_certificate_configuration.value.scope : []
            content {
              protocols = scope.value.protocols

              dynamic "destination" {
                for_each = scope.value.destination != null ? scope.value.destination : []
                content {
                  address_definition = destination.value.address_definition
                }
              }

              dynamic "destination_ports" {
                for_each = scope.value.destination_ports != null ? scope.value.destination_ports : []
                content {
                  from_port = destination_ports.value.from_port
                  to_port   = destination_ports.value.to_port
                }
              }

              dynamic "source" {
                for_each = scope.value.source != null ? scope.value.source : []
                content {
                  address_definition = source.value.address_definition
                }
              }

              dynamic "source_ports" {
                for_each = scope.value.source_ports != null ? scope.value.source_ports : []
                content {
                  from_port = source_ports.value.from_port
                  to_port   = source_ports.value.to_port
                }
              }
            }
          }

          dynamic "server_certificate" {
            for_each = server_certificate_configuration.value.server_certificate != null ? server_certificate_configuration.value.server_certificate : []
            content {
              resource_arn = server_certificate.value.resource_arn
            }
          }
        }
      }
    }
  }
}
