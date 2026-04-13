variable "bedrock_guardrails" {
  description = <<EOT
Map of bedrock_guardrails, attributes below
Required:
    - blocked_input_messaging
    - blocked_outputs_messaging
    - name
Optional:
    - description
    - kms_key_arn
    - region
    - tags
    - content_policy_config
    - contextual_grounding_policy_config
    - cross_region_config
    - sensitive_information_policy_config
    - topic_policy_config
    - word_policy_config
EOT

  type = map(object({
    blocked_input_messaging             = string
    blocked_outputs_messaging           = string
    name                                = string
    description                         = optional(string)
    kms_key_arn                         = optional(string)
    region                              = optional(string)
    tags                                = optional(map(string))
    content_policy_config               = optional(list(object({
            tier_config    = optional(list(object({
                tier_name = string
            })))
            filters_config = optional(set(object({
                input_strength    = string
                output_strength   = string
                type              = string
                input_action      = optional(string)
                input_enabled     = optional(bool)
                input_modalities  = optional(list(string))
                output_action     = optional(string)
                output_enabled    = optional(bool)
                output_modalities = optional(list(string))
            })))
        })))
    contextual_grounding_policy_config  = optional(list(object({
            filters_config = optional(list(object({
                threshold = number
                type      = string
            })))
        })))
    cross_region_config                 = optional(list(object({
            guardrail_profile_identifier = string
        })))
    sensitive_information_policy_config = optional(list(object({
            pii_entities_config = optional(list(object({
                action         = string
                type           = string
                input_action   = optional(string)
                input_enabled  = optional(bool)
                output_action  = optional(string)
                output_enabled = optional(bool)
            })))
            regexes_config      = optional(list(object({
                action         = string
                name           = string
                pattern        = string
                description    = optional(string)
                input_action   = optional(string)
                input_enabled  = optional(bool)
                output_action  = optional(string)
                output_enabled = optional(bool)
            })))
        })))
    topic_policy_config                 = optional(list(object({
            tier_config   = optional(list(object({
                tier_name = string
            })))
            topics_config = optional(list(object({
                definition = string
                name       = string
                type       = string
                examples   = optional(list(string))
            })))
        })))
    word_policy_config                  = optional(list(object({
            managed_word_lists_config = optional(list(object({
                type           = string
                input_action   = optional(string)
                input_enabled  = optional(bool)
                output_action  = optional(string)
                output_enabled = optional(bool)
            })))
            words_config              = optional(list(object({
                text           = string
                input_action   = optional(string)
                input_enabled  = optional(bool)
                output_action  = optional(string)
                output_enabled = optional(bool)
            })))
        })))
  }))
}
