resource "aws_ec2_client_vpn_endpoint" "ec2_client_vpn_endpoints" {
  for_each = var.ec2_client_vpn_endpoints

  server_certificate_arn        = each.value.server_certificate_arn
  client_cidr_block             = each.value.client_cidr_block
  description                   = each.value.description
  disconnect_on_session_timeout = each.value.disconnect_on_session_timeout
  dns_servers                   = each.value.dns_servers
  endpoint_ip_address_type      = each.value.endpoint_ip_address_type
  region                        = each.value.region
  security_group_ids            = each.value.security_group_ids
  self_service_portal           = each.value.self_service_portal
  session_timeout_hours         = each.value.session_timeout_hours
  split_tunnel                  = each.value.split_tunnel
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  traffic_ip_address_type       = each.value.traffic_ip_address_type
  transport_protocol            = each.value.transport_protocol
  vpc_id                        = each.value.vpc_id
  vpn_port                      = each.value.vpn_port

  dynamic "authentication_options" {
    for_each = each.value.authentication_options != null ? each.value.authentication_options : []
    content {
      type                           = authentication_options.value.type
      active_directory_id            = authentication_options.value.active_directory_id
      root_certificate_chain_arn     = authentication_options.value.root_certificate_chain_arn
      saml_provider_arn              = authentication_options.value.saml_provider_arn
      self_service_saml_provider_arn = authentication_options.value.self_service_saml_provider_arn
    }
  }

  dynamic "client_connect_options" {
    for_each = each.value.client_connect_options != null ? each.value.client_connect_options : []
    content {
      enabled             = client_connect_options.value.enabled
      lambda_function_arn = client_connect_options.value.lambda_function_arn
    }
  }

  dynamic "client_login_banner_options" {
    for_each = each.value.client_login_banner_options != null ? each.value.client_login_banner_options : []
    content {
      banner_text = client_login_banner_options.value.banner_text
      enabled     = client_login_banner_options.value.enabled
    }
  }

  dynamic "client_route_enforcement_options" {
    for_each = each.value.client_route_enforcement_options != null ? each.value.client_route_enforcement_options : []
    content {
      enforced = client_route_enforcement_options.value.enforced
    }
  }

  dynamic "connection_log_options" {
    for_each = each.value.connection_log_options != null ? each.value.connection_log_options : []
    content {
      enabled               = connection_log_options.value.enabled
      cloudwatch_log_group  = connection_log_options.value.cloudwatch_log_group
      cloudwatch_log_stream = connection_log_options.value.cloudwatch_log_stream
    }
  }

  dynamic "transit_gateway_configuration" {
    for_each = each.value.transit_gateway_configuration != null ? each.value.transit_gateway_configuration : []
    content {
      availability_zone_ids = transit_gateway_configuration.value.availability_zone_ids
      availability_zones    = transit_gateway_configuration.value.availability_zones
      transit_gateway_id    = transit_gateway_configuration.value.transit_gateway_id
    }
  }
}
