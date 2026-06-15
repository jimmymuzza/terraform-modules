variable "sns_topics" {
  description = <<EOT
Map of sns_topics, attributes below
Optional:
    - application_failure_feedback_role_arn
    - application_success_feedback_role_arn
    - application_success_feedback_sample_rate
    - archive_policy
    - content_based_deduplication
    - delivery_policy
    - display_name
    - fifo_throughput_scope
    - fifo_topic
    - firehose_failure_feedback_role_arn
    - firehose_success_feedback_role_arn
    - firehose_success_feedback_sample_rate
    - http_failure_feedback_role_arn
    - http_success_feedback_role_arn
    - http_success_feedback_sample_rate
    - kms_master_key_id
    - lambda_failure_feedback_role_arn
    - lambda_success_feedback_role_arn
    - lambda_success_feedback_sample_rate
    - name
    - name_prefix
    - policy
    - region
    - signature_version
    - sqs_failure_feedback_role_arn
    - sqs_success_feedback_role_arn
    - sqs_success_feedback_sample_rate
    - tags
    - tags_all
    - tracing_config
EOT

  type = map(object({
    application_failure_feedback_role_arn    = optional(string)
    application_success_feedback_role_arn    = optional(string)
    application_success_feedback_sample_rate = optional(number)
    archive_policy                           = optional(string)
    content_based_deduplication              = optional(bool)
    delivery_policy                          = optional(string)
    display_name                             = optional(string)
    fifo_throughput_scope                    = optional(string)
    fifo_topic                               = optional(bool)
    firehose_failure_feedback_role_arn       = optional(string)
    firehose_success_feedback_role_arn       = optional(string)
    firehose_success_feedback_sample_rate    = optional(number)
    http_failure_feedback_role_arn           = optional(string)
    http_success_feedback_role_arn           = optional(string)
    http_success_feedback_sample_rate        = optional(number)
    kms_master_key_id                        = optional(string)
    lambda_failure_feedback_role_arn         = optional(string)
    lambda_success_feedback_role_arn         = optional(string)
    lambda_success_feedback_sample_rate      = optional(number)
    name                                     = optional(string)
    name_prefix                              = optional(string)
    policy                                   = optional(string)
    region                                   = optional(string)
    signature_version                        = optional(number)
    sqs_failure_feedback_role_arn            = optional(string)
    sqs_success_feedback_role_arn            = optional(string)
    sqs_success_feedback_sample_rate         = optional(number)
    tags                                     = optional(map(string))
    tags_all                                 = optional(map(string))
    tracing_config                           = optional(string)
  }))
}
