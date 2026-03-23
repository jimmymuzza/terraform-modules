resource "aws_transfer_web_app" "transfer_web_apps" {
  for_each = var.transfer_web_apps

  access_endpoint         = each.value.access_endpoint
  region                  = each.value.region
  tags                    = each.value.tags
  web_app_endpoint_policy = each.value.web_app_endpoint_policy
  web_app_units           = each.value.web_app_units

  dynamic "endpoint_details" {
    for_each = each.value.endpoint_details != null ? each.value.endpoint_details : []
    content {

      dynamic "vpc" {
        for_each = endpoint_details.value.vpc != null ? endpoint_details.value.vpc : []
        content {
          subnet_ids         = vpc.value.subnet_ids
          vpc_id             = vpc.value.vpc_id
          security_group_ids = vpc.value.security_group_ids
        }
      }
    }
  }

  dynamic "identity_provider_details" {
    for_each = each.value.identity_provider_details != null ? each.value.identity_provider_details : []
    content {

      dynamic "identity_center_config" {
        for_each = identity_provider_details.value.identity_center_config != null ? identity_provider_details.value.identity_center_config : []
        content {
          instance_arn = identity_center_config.value.instance_arn
          role         = identity_center_config.value.role
        }
      }
    }
  }
}
