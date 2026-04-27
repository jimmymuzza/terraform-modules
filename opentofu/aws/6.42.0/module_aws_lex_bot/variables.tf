variable "lex_bots" {
  description = <<EOT
Map of lex_bots, attributes below
Required:
    - child_directed
    - name
    - abort_statement
    - intent
Optional:
    - create_version
    - description
    - detect_sentiment
    - enable_model_improvements
    - idle_session_ttl_in_seconds
    - locale
    - nlu_intent_confidence_threshold
    - process_behavior
    - region
    - voice_id
    - clarification_prompt
EOT

  type = map(object({
    child_directed                  = bool
    name                            = string
    create_version                  = optional(bool)
    description                     = optional(string)
    detect_sentiment                = optional(bool)
    enable_model_improvements       = optional(bool)
    idle_session_ttl_in_seconds     = optional(number)
    locale                          = optional(string)
    nlu_intent_confidence_threshold = optional(number)
    process_behavior                = optional(string)
    region                          = optional(string)
    voice_id                        = optional(string)
    abort_statement                 = list(object({
            response_card = optional(string)
            message       = set(object({
                content      = string
                content_type = string
                group_number = optional(number)
            }))
        }))
    clarification_prompt            = optional(list(object({
            max_attempts  = number
            response_card = optional(string)
            message       = set(object({
                content      = string
                content_type = string
                group_number = optional(number)
            }))
        })))
    intent                          = set(object({
            intent_name    = string
            intent_version = string
        }))
  }))
}
