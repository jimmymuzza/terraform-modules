resource "aws_sns_topic" "sns_topics" {
  for_each = var.sns_topics

  application_failure_feedback_role_arn    = each.value.application_failure_feedback_role_arn
  application_success_feedback_role_arn    = each.value.application_success_feedback_role_arn
  application_success_feedback_sample_rate = each.value.application_success_feedback_sample_rate
  archive_policy                           = each.value.archive_policy
  content_based_deduplication              = each.value.content_based_deduplication
  delivery_policy                          = each.value.delivery_policy
  display_name                             = each.value.display_name
  fifo_throughput_scope                    = each.value.fifo_throughput_scope
  fifo_topic                               = each.value.fifo_topic
  firehose_failure_feedback_role_arn       = each.value.firehose_failure_feedback_role_arn
  firehose_success_feedback_role_arn       = each.value.firehose_success_feedback_role_arn
  firehose_success_feedback_sample_rate    = each.value.firehose_success_feedback_sample_rate
  http_failure_feedback_role_arn           = each.value.http_failure_feedback_role_arn
  http_success_feedback_role_arn           = each.value.http_success_feedback_role_arn
  http_success_feedback_sample_rate        = each.value.http_success_feedback_sample_rate
  kms_master_key_id                        = each.value.kms_master_key_id
  lambda_failure_feedback_role_arn         = each.value.lambda_failure_feedback_role_arn
  lambda_success_feedback_role_arn         = each.value.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = each.value.lambda_success_feedback_sample_rate
  name                                     = each.value.name
  name_prefix                              = each.value.name_prefix
  policy                                   = each.value.policy
  region                                   = each.value.region
  signature_version                        = each.value.signature_version
  sqs_failure_feedback_role_arn            = each.value.sqs_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = each.value.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = each.value.sqs_success_feedback_sample_rate
  tags                                     = each.value.tags
  tags_all                                 = each.value.tags_all
  tracing_config                           = each.value.tracing_config
}
