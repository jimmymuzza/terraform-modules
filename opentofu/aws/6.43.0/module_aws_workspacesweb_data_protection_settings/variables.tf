variable "workspacesweb_data_protection_settings" {
  description = <<EOT
Map of workspacesweb_data_protection_settings, attributes below
Required:
    - display_name
Optional:
    - additional_encryption_context
    - customer_managed_key
    - description
    - region
    - tags
    - inline_redaction_configuration
EOT

  type = map(object({
    display_name                   = string
    additional_encryption_context  = optional(map(string))
    customer_managed_key           = optional(string)
    description                    = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    inline_redaction_configuration = optional(list(object({
            global_confidence_level  = optional(number)
            global_enforced_urls     = optional(list(string))
            global_exempt_urls       = optional(list(string))
            inline_redaction_pattern = optional(list(object({
                built_in_pattern_id    = optional(string)
                confidence_level       = optional(number)
                enforced_urls          = optional(list(string))
                exempt_urls            = optional(list(string))
                custom_pattern         = optional(list(object({
                    pattern_name        = string
                    pattern_regex       = string
                    keyword_regex       = optional(string)
                    pattern_description = optional(string)
                })))
                redaction_place_holder = optional(list(object({
                    redaction_place_holder_type = string
                    redaction_place_holder_text = optional(string)
                })))
            })))
        })))
  }))
}
