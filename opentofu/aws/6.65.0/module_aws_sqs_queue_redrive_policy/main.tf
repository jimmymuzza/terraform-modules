resource "aws_sqs_queue_redrive_policy" "sqs_queue_redrive_policies" {
  for_each = var.sqs_queue_redrive_policies

  queue_url      = each.value.queue_url
  redrive_policy = each.value.redrive_policy
  region         = each.value.region
}
