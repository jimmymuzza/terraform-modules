resource "aws_verifiedaccess_endpoint" "verifiedaccess_endpoints" {
  for_each = var.verifiedaccess_endpoints

  attachment_type          = each.value.attachment_type
  endpoint_type            = each.value.endpoint_type
  verified_access_group_id = each.value.verified_access_group_id
  application_domain       = each.value.application_domain
  description              = each.value.description
  domain_certificate_arn   = each.value.domain_certificate_arn
  endpoint_domain_prefix   = each.value.endpoint_domain_prefix
  policy_document          = each.value.policy_document
  region                   = each.value.region
  security_group_ids       = each.value.security_group_ids
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all

  dynamic "cidr_options" {
    for_each = each.value.cidr_options != null ? each.value.cidr_options : []
    content {
      cidr       = cidr_options.value.cidr
      protocol   = cidr_options.value.protocol
      subnet_ids = cidr_options.value.subnet_ids

      dynamic "port_range" {
        for_each = cidr_options.value.port_range != null ? cidr_options.value.port_range : []
        content {
          from_port = port_range.value.from_port
          to_port   = port_range.value.to_port
        }
      }
    }
  }

  dynamic "load_balancer_options" {
    for_each = each.value.load_balancer_options != null ? each.value.load_balancer_options : []
    content {
      load_balancer_arn = load_balancer_options.value.load_balancer_arn
      port              = load_balancer_options.value.port
      protocol          = load_balancer_options.value.protocol
      subnet_ids        = load_balancer_options.value.subnet_ids

      dynamic "port_range" {
        for_each = load_balancer_options.value.port_range != null ? load_balancer_options.value.port_range : []
        content {
          from_port = port_range.value.from_port
          to_port   = port_range.value.to_port
        }
      }
    }
  }

  dynamic "network_interface_options" {
    for_each = each.value.network_interface_options != null ? each.value.network_interface_options : []
    content {
      network_interface_id = network_interface_options.value.network_interface_id
      port                 = network_interface_options.value.port
      protocol             = network_interface_options.value.protocol

      dynamic "port_range" {
        for_each = network_interface_options.value.port_range != null ? network_interface_options.value.port_range : []
        content {
          from_port = port_range.value.from_port
          to_port   = port_range.value.to_port
        }
      }
    }
  }

  dynamic "rds_options" {
    for_each = each.value.rds_options != null ? each.value.rds_options : []
    content {
      port                = rds_options.value.port
      protocol            = rds_options.value.protocol
      rds_db_cluster_arn  = rds_options.value.rds_db_cluster_arn
      rds_db_instance_arn = rds_options.value.rds_db_instance_arn
      rds_db_proxy_arn    = rds_options.value.rds_db_proxy_arn
      rds_endpoint        = rds_options.value.rds_endpoint
      subnet_ids          = rds_options.value.subnet_ids
    }
  }

  dynamic "sse_specification" {
    for_each = each.value.sse_specification != null ? each.value.sse_specification : []
    content {
      customer_managed_key_enabled = sse_specification.value.customer_managed_key_enabled
      kms_key_arn                  = sse_specification.value.kms_key_arn
    }
  }
}
