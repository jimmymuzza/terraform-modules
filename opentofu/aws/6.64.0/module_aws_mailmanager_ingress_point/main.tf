resource "aws_mailmanager_ingress_point" "mailmanager_ingress_points" {
  for_each = var.mailmanager_ingress_points

  name              = each.value.name
  rule_set_id       = each.value.rule_set_id
  traffic_policy_id = each.value.traffic_policy_id
  type              = each.value.type
  region            = each.value.region
  tags              = each.value.tags
  tls_policy        = each.value.tls_policy

  dynamic "ingress_point_configuration" {
    for_each = each.value.ingress_point_configuration != null ? each.value.ingress_point_configuration : []
    content {
      secret_arn               = ingress_point_configuration.value.secret_arn
      smtp_password_wo         = ingress_point_configuration.value.smtp_password_wo
      smtp_password_wo_version = ingress_point_configuration.value.smtp_password_wo_version

      dynamic "tls_auth_configuration" {
        for_each = ingress_point_configuration.value.tls_auth_configuration != null ? ingress_point_configuration.value.tls_auth_configuration : []
        content {

          dynamic "trust_store" {
            for_each = tls_auth_configuration.value.trust_store != null ? tls_auth_configuration.value.trust_store : []
            content {
              ca_content  = trust_store.value.ca_content
              crl_content = trust_store.value.crl_content
              kms_key_arn = trust_store.value.kms_key_arn
            }
          }
        }
      }
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {

      dynamic "private_network_configuration" {
        for_each = network_configuration.value.private_network_configuration != null ? network_configuration.value.private_network_configuration : []
        content {
          vpc_endpoint_id = private_network_configuration.value.vpc_endpoint_id
        }
      }

      dynamic "public_network_configuration" {
        for_each = network_configuration.value.public_network_configuration != null ? network_configuration.value.public_network_configuration : []
        content {
          ip_type = public_network_configuration.value.ip_type
        }
      }
    }
  }
}
