variable "cleanrooms_collaborations" {
  description = <<EOT
Map of cleanrooms_collaborations, attributes below
Required:
    - creator_display_name
    - creator_member_abilities
    - description
    - name
    - query_log_status
Optional:
    - analytics_engine
    - region
    - tags
    - tags_all
    - data_encryption_metadata
    - member
EOT

  type = map(object({
    creator_display_name     = string
    creator_member_abilities = list(string)
    description              = string
    name                     = string
    query_log_status         = string
    analytics_engine         = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    data_encryption_metadata = optional(list(object({
            allow_clear_text                            = bool
            allow_duplicates                            = bool
            allow_joins_on_columns_with_different_names = bool
            preserve_nulls                              = bool
        })))
    member                   = optional(set(object({
            account_id       = string
            display_name     = string
            member_abilities = list(string)
        })))
  }))
}
