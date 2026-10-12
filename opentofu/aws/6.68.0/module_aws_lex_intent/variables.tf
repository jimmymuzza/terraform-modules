variable "lex_intents" {
  description = <<EOT
Map of lex_intents, attributes below
Required:
    - name
    - fulfillment_activity
Optional:
    - create_version
    - description
    - parent_intent_signature
    - region
    - sample_utterances
    - conclusion_statement
    - confirmation_prompt
    - dialog_code_hook
    - follow_up_prompt
    - rejection_statement
    - slot
EOT

  type = map(object({
    name                    = string
    create_version          = optional(bool)
    description             = optional(string)
    parent_intent_signature = optional(string)
    region                  = optional(string)
    sample_utterances       = optional(set(string))
    conclusion_statement    = optional(list(object({
            response_card = optional(string)
            message       = set(object({
                content      = string
                content_type = string
                group_number = optional(number)
            }))
        })))
    confirmation_prompt     = optional(list(object({
            max_attempts  = number
            response_card = optional(string)
            message       = set(object({
                content      = string
                content_type = string
                group_number = optional(number)
            }))
        })))
    dialog_code_hook        = optional(list(object({
            message_version = string
            uri             = string
        })))
    follow_up_prompt        = optional(list(object({
            prompt              = list(object({
                max_attempts  = number
                response_card = optional(string)
                message       = set(object({
                    content      = string
                    content_type = string
                    group_number = optional(number)
                }))
            }))
            rejection_statement = list(object({
                response_card = optional(string)
                message       = set(object({
                    content      = string
                    content_type = string
                    group_number = optional(number)
                }))
            }))
        })))
    fulfillment_activity    = list(object({
            type      = string
            code_hook = optional(list(object({
                message_version = string
                uri             = string
            })))
        }))
    rejection_statement     = optional(list(object({
            response_card = optional(string)
            message       = set(object({
                content      = string
                content_type = string
                group_number = optional(number)
            }))
        })))
    slot                    = optional(set(object({
            name                     = string
            slot_constraint          = string
            slot_type                = string
            description              = optional(string)
            priority                 = optional(number)
            response_card            = optional(string)
            sample_utterances        = optional(list(string))
            slot_type_version        = optional(string)
            value_elicitation_prompt = optional(list(object({
                max_attempts  = number
                response_card = optional(string)
                message       = set(object({
                    content      = string
                    content_type = string
                    group_number = optional(number)
                }))
            })))
        })))
  }))
}
