variable "chimesdkmediapipelines_media_insights_pipeline_configurations" {
  description = <<EOT
Map of chimesdkmediapipelines_media_insights_pipeline_configurations, attributes below
Required:
    - name
    - resource_access_role_arn
    - elements
Optional:
    - region
    - tags
    - tags_all
    - real_time_alert_configuration
EOT

  type = map(object({
    name                          = string
    resource_access_role_arn      = string
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    elements                      = list(object({
            type                                                     = string
            amazon_transcribe_call_analytics_processor_configuration = optional(list(object({
                language_code                        = string
                call_analytics_stream_categories     = optional(list(string))
                content_identification_type          = optional(string)
                content_redaction_type               = optional(string)
                enable_partial_results_stabilization = optional(bool)
                filter_partial_results               = optional(bool)
                language_model_name                  = optional(string)
                partial_results_stability            = optional(string)
                pii_entity_types                     = optional(string)
                vocabulary_filter_method             = optional(string)
                vocabulary_filter_name               = optional(string)
                vocabulary_name                      = optional(string)
                post_call_analytics_settings         = optional(list(object({
                    data_access_role_arn         = string
                    output_location              = string
                    content_redaction_output     = optional(string)
                    output_encryption_kms_key_id = optional(string)
                })))
            })))
            amazon_transcribe_processor_configuration                = optional(list(object({
                language_code                        = string
                content_identification_type          = optional(string)
                content_redaction_type               = optional(string)
                enable_partial_results_stabilization = optional(bool)
                filter_partial_results               = optional(bool)
                language_model_name                  = optional(string)
                partial_results_stability            = optional(string)
                pii_entity_types                     = optional(string)
                show_speaker_label                   = optional(bool)
                vocabulary_filter_method             = optional(string)
                vocabulary_filter_name               = optional(string)
                vocabulary_name                      = optional(string)
            })))
            kinesis_data_stream_sink_configuration                   = optional(list(object({
                insights_target = string
            })))
            lambda_function_sink_configuration                       = optional(list(object({
                insights_target = string
            })))
            s3_recording_sink_configuration                          = optional(list(object({
                destination = optional(string)
            })))
            sns_topic_sink_configuration                             = optional(list(object({
                insights_target = string
            })))
            sqs_queue_sink_configuration                             = optional(list(object({
                insights_target = string
            })))
            voice_analytics_processor_configuration                  = optional(list(object({
                speaker_search_status      = string
                voice_tone_analysis_status = string
            })))
        }))
    real_time_alert_configuration = optional(list(object({
            disabled = optional(bool)
            rules    = list(object({
                type                          = string
                issue_detection_configuration = optional(list(object({
                    rule_name = string
                })))
                keyword_match_configuration   = optional(list(object({
                    keywords  = list(string)
                    rule_name = string
                    negate    = optional(bool)
                })))
                sentiment_configuration       = optional(list(object({
                    rule_name      = string
                    sentiment_type = string
                    time_period    = number
                })))
            }))
        })))
  }))
}
