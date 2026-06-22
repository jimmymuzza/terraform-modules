resource "aws_lex_bot" "lex_bots" {
  for_each = var.lex_bots

  child_directed                  = each.value.child_directed
  name                            = each.value.name
  create_version                  = each.value.create_version
  description                     = each.value.description
  detect_sentiment                = each.value.detect_sentiment
  enable_model_improvements       = each.value.enable_model_improvements
  idle_session_ttl_in_seconds     = each.value.idle_session_ttl_in_seconds
  locale                          = each.value.locale
  nlu_intent_confidence_threshold = each.value.nlu_intent_confidence_threshold
  process_behavior                = each.value.process_behavior
  region                          = each.value.region
  voice_id                        = each.value.voice_id

  dynamic "abort_statement" {
    for_each = each.value.abort_statement != null ? each.value.abort_statement : []
    content {
      response_card = abort_statement.value.response_card

      dynamic "message" {
        for_each = abort_statement.value.message != null ? abort_statement.value.message : []
        content {
          content      = message.value.content
          content_type = message.value.content_type
          group_number = message.value.group_number
        }
      }
    }
  }

  dynamic "clarification_prompt" {
    for_each = each.value.clarification_prompt != null ? each.value.clarification_prompt : []
    content {
      max_attempts  = clarification_prompt.value.max_attempts
      response_card = clarification_prompt.value.response_card

      dynamic "message" {
        for_each = clarification_prompt.value.message != null ? clarification_prompt.value.message : []
        content {
          content      = message.value.content
          content_type = message.value.content_type
          group_number = message.value.group_number
        }
      }
    }
  }

  dynamic "intent" {
    for_each = each.value.intent != null ? each.value.intent : []
    content {
      intent_name    = intent.value.intent_name
      intent_version = intent.value.intent_version
    }
  }
}
