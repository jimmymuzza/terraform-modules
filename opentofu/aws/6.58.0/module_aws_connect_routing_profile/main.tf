resource "aws_connect_routing_profile" "connect_routing_profiles" {
  for_each = var.connect_routing_profiles

  default_outbound_queue_id = each.value.default_outbound_queue_id
  description               = each.value.description
  instance_id               = each.value.instance_id
  name                      = each.value.name
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "media_concurrencies" {
    for_each = each.value.media_concurrencies != null ? each.value.media_concurrencies : []
    content {
      channel     = media_concurrencies.value.channel
      concurrency = media_concurrencies.value.concurrency

      dynamic "cross_channel_behavior" {
        for_each = media_concurrencies.value.cross_channel_behavior != null ? media_concurrencies.value.cross_channel_behavior : []
        content {
          behavior_type = cross_channel_behavior.value.behavior_type
        }
      }
    }
  }

  dynamic "queue_configs" {
    for_each = each.value.queue_configs != null ? each.value.queue_configs : []
    content {
      channel  = queue_configs.value.channel
      delay    = queue_configs.value.delay
      priority = queue_configs.value.priority
      queue_id = queue_configs.value.queue_id
    }
  }
}
