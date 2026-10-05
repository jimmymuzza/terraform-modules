resource "aws_sqs_queue" "sqs_queues" {
  for_each = var.sqs_queues

  content_based_deduplication       = each.value.content_based_deduplication
  deduplication_scope               = each.value.deduplication_scope
  delay_seconds                     = each.value.delay_seconds
  fifo_queue                        = each.value.fifo_queue
  fifo_throughput_limit             = each.value.fifo_throughput_limit
  kms_data_key_reuse_period_seconds = each.value.kms_data_key_reuse_period_seconds
  kms_master_key_id                 = each.value.kms_master_key_id
  max_message_size                  = each.value.max_message_size
  message_retention_seconds         = each.value.message_retention_seconds
  name                              = each.value.name
  name_prefix                       = each.value.name_prefix
  policy                            = each.value.policy
  receive_wait_time_seconds         = each.value.receive_wait_time_seconds
  redrive_allow_policy              = each.value.redrive_allow_policy
  redrive_policy                    = each.value.redrive_policy
  region                            = each.value.region
  sqs_managed_sse_enabled           = each.value.sqs_managed_sse_enabled
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
  visibility_timeout_seconds        = each.value.visibility_timeout_seconds
}
