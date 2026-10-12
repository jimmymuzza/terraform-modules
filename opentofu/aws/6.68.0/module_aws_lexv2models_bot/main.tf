resource "aws_lexv2models_bot" "lexv2models_bots" {
  for_each = var.lexv2models_bots

  idle_session_ttl_in_seconds = each.value.idle_session_ttl_in_seconds
  name                        = each.value.name
  role_arn                    = each.value.role_arn
  description                 = each.value.description
  region                      = each.value.region
  tags                        = each.value.tags
  test_bot_alias_tags         = each.value.test_bot_alias_tags
  type                        = each.value.type

  dynamic "data_privacy" {
    for_each = each.value.data_privacy != null ? each.value.data_privacy : []
    content {
      child_directed = data_privacy.value.child_directed
    }
  }

  dynamic "members" {
    for_each = each.value.members != null ? each.value.members : []
    content {
      alias_id   = members.value.alias_id
      alias_name = members.value.alias_name
      name       = members.value.name
      version    = members.value.version
    }
  }
}
