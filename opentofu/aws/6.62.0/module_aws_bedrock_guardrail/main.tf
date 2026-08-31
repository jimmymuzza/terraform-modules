resource "aws_bedrock_guardrail" "bedrock_guardrails" {
  for_each = var.bedrock_guardrails

  blocked_input_messaging   = each.value.blocked_input_messaging
  blocked_outputs_messaging = each.value.blocked_outputs_messaging
  name                      = each.value.name
  description               = each.value.description
  kms_key_arn               = each.value.kms_key_arn
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "content_policy_config" {
    for_each = each.value.content_policy_config != null ? each.value.content_policy_config : []
    content {
      tier_config = content_policy_config.value.tier_config

      dynamic "filters_config" {
        for_each = content_policy_config.value.filters_config != null ? content_policy_config.value.filters_config : []
        content {
          input_strength    = filters_config.value.input_strength
          output_strength   = filters_config.value.output_strength
          type              = filters_config.value.type
          input_action      = filters_config.value.input_action
          input_enabled     = filters_config.value.input_enabled
          input_modalities  = filters_config.value.input_modalities
          output_action     = filters_config.value.output_action
          output_enabled    = filters_config.value.output_enabled
          output_modalities = filters_config.value.output_modalities
        }
      }
    }
  }

  dynamic "contextual_grounding_policy_config" {
    for_each = each.value.contextual_grounding_policy_config != null ? each.value.contextual_grounding_policy_config : []
    content {

      dynamic "filters_config" {
        for_each = contextual_grounding_policy_config.value.filters_config != null ? contextual_grounding_policy_config.value.filters_config : []
        content {
          threshold = filters_config.value.threshold
          type      = filters_config.value.type
        }
      }
    }
  }

  dynamic "cross_region_config" {
    for_each = each.value.cross_region_config != null ? each.value.cross_region_config : []
    content {
      guardrail_profile_identifier = cross_region_config.value.guardrail_profile_identifier
    }
  }

  dynamic "sensitive_information_policy_config" {
    for_each = each.value.sensitive_information_policy_config != null ? each.value.sensitive_information_policy_config : []
    content {

      dynamic "pii_entities_config" {
        for_each = sensitive_information_policy_config.value.pii_entities_config != null ? sensitive_information_policy_config.value.pii_entities_config : []
        content {
          action         = pii_entities_config.value.action
          type           = pii_entities_config.value.type
          input_action   = pii_entities_config.value.input_action
          input_enabled  = pii_entities_config.value.input_enabled
          output_action  = pii_entities_config.value.output_action
          output_enabled = pii_entities_config.value.output_enabled
        }
      }

      dynamic "regexes_config" {
        for_each = sensitive_information_policy_config.value.regexes_config != null ? sensitive_information_policy_config.value.regexes_config : []
        content {
          action         = regexes_config.value.action
          name           = regexes_config.value.name
          pattern        = regexes_config.value.pattern
          description    = regexes_config.value.description
          input_action   = regexes_config.value.input_action
          input_enabled  = regexes_config.value.input_enabled
          output_action  = regexes_config.value.output_action
          output_enabled = regexes_config.value.output_enabled
        }
      }
    }
  }

  dynamic "topic_policy_config" {
    for_each = each.value.topic_policy_config != null ? each.value.topic_policy_config : []
    content {
      tier_config = topic_policy_config.value.tier_config

      dynamic "topics_config" {
        for_each = topic_policy_config.value.topics_config != null ? topic_policy_config.value.topics_config : []
        content {
          definition = topics_config.value.definition
          name       = topics_config.value.name
          type       = topics_config.value.type
          examples   = topics_config.value.examples
        }
      }
    }
  }

  dynamic "word_policy_config" {
    for_each = each.value.word_policy_config != null ? each.value.word_policy_config : []
    content {

      dynamic "managed_word_lists_config" {
        for_each = word_policy_config.value.managed_word_lists_config != null ? word_policy_config.value.managed_word_lists_config : []
        content {
          type           = managed_word_lists_config.value.type
          input_action   = managed_word_lists_config.value.input_action
          input_enabled  = managed_word_lists_config.value.input_enabled
          output_action  = managed_word_lists_config.value.output_action
          output_enabled = managed_word_lists_config.value.output_enabled
        }
      }

      dynamic "words_config" {
        for_each = word_policy_config.value.words_config != null ? word_policy_config.value.words_config : []
        content {
          text           = words_config.value.text
          input_action   = words_config.value.input_action
          input_enabled  = words_config.value.input_enabled
          output_action  = words_config.value.output_action
          output_enabled = words_config.value.output_enabled
        }
      }
    }
  }
}
