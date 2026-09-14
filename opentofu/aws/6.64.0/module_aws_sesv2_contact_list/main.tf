resource "aws_sesv2_contact_list" "sesv2_contact_lists" {
  for_each = var.sesv2_contact_lists

  contact_list_name = each.value.contact_list_name
  description       = each.value.description
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "topic" {
    for_each = each.value.topic != null ? each.value.topic : []
    content {
      default_subscription_status = topic.value.default_subscription_status
      display_name                = topic.value.display_name
      topic_name                  = topic.value.topic_name
      description                 = topic.value.description
    }
  }
}
