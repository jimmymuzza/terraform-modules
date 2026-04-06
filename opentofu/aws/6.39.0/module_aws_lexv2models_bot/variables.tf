variable "lexv2models_bots" {
  description = <<EOT
Map of lexv2models_bots, attributes below
Required:
    - idle_session_ttl_in_seconds
    - name
    - role_arn
Optional:
    - description
    - region
    - tags
    - test_bot_alias_tags
    - type
    - data_privacy
    - members
EOT

  type = map(object({
    idle_session_ttl_in_seconds = number
    name                        = string
    role_arn                    = string
    description                 = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    test_bot_alias_tags         = optional(map(string))
    type                        = optional(string)
    data_privacy                = optional(list(object({
            child_directed = bool
        })))
    members                     = optional(list(object({
            alias_id   = string
            alias_name = string
            name       = string
            version    = string
        })))
  }))
}
