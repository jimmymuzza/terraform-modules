resource "aws_appstream_stack" "appstream_stacks" {
  for_each = var.appstream_stacks

  name               = each.value.name
  description        = each.value.description
  display_name       = each.value.display_name
  embed_host_domains = each.value.embed_host_domains
  feedback_url       = each.value.feedback_url
  redirect_url       = each.value.redirect_url
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "access_endpoints" {
    for_each = each.value.access_endpoints != null ? each.value.access_endpoints : []
    content {
      endpoint_type = access_endpoints.value.endpoint_type
      vpce_id       = access_endpoints.value.vpce_id
    }
  }

  dynamic "application_settings" {
    for_each = each.value.application_settings != null ? each.value.application_settings : []
    content {
      enabled        = application_settings.value.enabled
      settings_group = application_settings.value.settings_group
    }
  }

  dynamic "storage_connectors" {
    for_each = each.value.storage_connectors != null ? each.value.storage_connectors : []
    content {
      connector_type      = storage_connectors.value.connector_type
      domains             = storage_connectors.value.domains
      resource_identifier = storage_connectors.value.resource_identifier
    }
  }

  dynamic "streaming_experience_settings" {
    for_each = each.value.streaming_experience_settings != null ? each.value.streaming_experience_settings : []
    content {
      preferred_protocol = streaming_experience_settings.value.preferred_protocol
    }
  }

  dynamic "user_settings" {
    for_each = each.value.user_settings != null ? each.value.user_settings : []
    content {
      action     = user_settings.value.action
      permission = user_settings.value.permission
    }
  }
}
