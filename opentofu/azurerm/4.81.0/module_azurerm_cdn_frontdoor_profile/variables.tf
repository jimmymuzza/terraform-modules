variable "cdn_frontdoor_profiles" {
  description = <<EOT
Map of cdn_frontdoor_profiles, attributes below
Required:
    - name
    - resource_group_name
    - sku_name
Optional:
    - response_timeout_seconds
    - tags
    - identity
    - log_scrubbing_rule
EOT

  type = map(object({
    name                     = string
    resource_group_name      = string
    sku_name                 = string
    response_timeout_seconds = optional(number)
    tags                     = optional(map(string))
    identity                 = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    log_scrubbing_rule       = optional(set(object({
            match_variable = string
        })))
  }))
}
