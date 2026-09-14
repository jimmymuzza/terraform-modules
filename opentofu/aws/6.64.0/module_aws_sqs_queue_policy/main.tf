resource "aws_sqs_queue_policy" "sqs_queue_policies" {
  for_each = var.sqs_queue_policies

  policy    = each.value.policy
  queue_url = each.value.queue_url
  region    = each.value.region
}
