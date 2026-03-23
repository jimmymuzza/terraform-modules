resource "aws_ivschat_room" "ivschat_rooms" {
  for_each = var.ivschat_rooms

  logging_configuration_identifiers = each.value.logging_configuration_identifiers
  maximum_message_length            = each.value.maximum_message_length
  maximum_message_rate_per_second   = each.value.maximum_message_rate_per_second
  name                              = each.value.name
  region                            = each.value.region
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all

  dynamic "message_review_handler" {
    for_each = each.value.message_review_handler != null ? each.value.message_review_handler : []
    content {
      fallback_result = message_review_handler.value.fallback_result
      uri             = message_review_handler.value.uri
    }
  }
}
