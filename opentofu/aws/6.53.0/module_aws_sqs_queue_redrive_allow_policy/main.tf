resource "aws_sqs_queue_redrive_allow_policy" "sqs_queue_redrive_allow_policies" {
  for_each = var.sqs_queue_redrive_allow_policies

  queue_url            = each.value.queue_url
  redrive_allow_policy = each.value.redrive_allow_policy
  region               = each.value.region
}
