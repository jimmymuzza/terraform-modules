variable "sqs_queues" {
  description = <<EOT
Map of sqs_queues, attributes below
Optional:
    - content_based_deduplication
    - deduplication_scope
    - delay_seconds
    - fifo_queue
    - fifo_throughput_limit
    - kms_data_key_reuse_period_seconds
    - kms_master_key_id
    - max_message_size
    - message_retention_seconds
    - name
    - name_prefix
    - policy
    - receive_wait_time_seconds
    - redrive_allow_policy
    - redrive_policy
    - region
    - sqs_managed_sse_enabled
    - tags
    - tags_all
    - visibility_timeout_seconds
EOT

  type = map(object({
    content_based_deduplication       = optional(bool)
    deduplication_scope               = optional(string)
    delay_seconds                     = optional(number)
    fifo_queue                        = optional(bool)
    fifo_throughput_limit             = optional(string)
    kms_data_key_reuse_period_seconds = optional(number)
    kms_master_key_id                 = optional(string)
    max_message_size                  = optional(number)
    message_retention_seconds         = optional(number)
    name                              = optional(string)
    name_prefix                       = optional(string)
    policy                            = optional(string)
    receive_wait_time_seconds         = optional(number)
    redrive_allow_policy              = optional(string)
    redrive_policy                    = optional(string)
    region                            = optional(string)
    sqs_managed_sse_enabled           = optional(bool)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    visibility_timeout_seconds        = optional(number)
  }))
}
