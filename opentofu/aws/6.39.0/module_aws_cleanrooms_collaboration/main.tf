resource "aws_cleanrooms_collaboration" "cleanrooms_collaborations" {
  for_each = var.cleanrooms_collaborations

  creator_display_name     = each.value.creator_display_name
  creator_member_abilities = each.value.creator_member_abilities
  description              = each.value.description
  name                     = each.value.name
  query_log_status         = each.value.query_log_status
  analytics_engine         = each.value.analytics_engine
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all

  dynamic "data_encryption_metadata" {
    for_each = each.value.data_encryption_metadata != null ? each.value.data_encryption_metadata : []
    content {
      allow_clear_text                            = data_encryption_metadata.value.allow_clear_text
      allow_duplicates                            = data_encryption_metadata.value.allow_duplicates
      allow_joins_on_columns_with_different_names = data_encryption_metadata.value.allow_joins_on_columns_with_different_names
      preserve_nulls                              = data_encryption_metadata.value.preserve_nulls
    }
  }

  dynamic "member" {
    for_each = each.value.member != null ? each.value.member : []
    content {
      account_id       = member.value.account_id
      display_name     = member.value.display_name
      member_abilities = member.value.member_abilities
    }
  }
}
