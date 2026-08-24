resource "aws_medialive_input" "medialive_inputs" {
  for_each = var.medialive_inputs

  name                  = each.value.name
  type                  = each.value.type
  input_security_groups = each.value.input_security_groups
  region                = each.value.region
  role_arn              = each.value.role_arn
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "destinations" {
    for_each = each.value.destinations != null ? each.value.destinations : []
    content {
      stream_name = destinations.value.stream_name
    }
  }

  dynamic "input_devices" {
    for_each = each.value.input_devices != null ? each.value.input_devices : []
    content {
    }
  }

  dynamic "media_connect_flows" {
    for_each = each.value.media_connect_flows != null ? each.value.media_connect_flows : []
    content {
      flow_arn = media_connect_flows.value.flow_arn
    }
  }

  dynamic "sources" {
    for_each = each.value.sources != null ? each.value.sources : []
    content {
      password_param = sources.value.password_param
      url            = sources.value.url
      username       = sources.value.username
    }
  }

  dynamic "vpc" {
    for_each = each.value.vpc != null ? each.value.vpc : []
    content {
      subnet_ids         = vpc.value.subnet_ids
      security_group_ids = vpc.value.security_group_ids
    }
  }
}
