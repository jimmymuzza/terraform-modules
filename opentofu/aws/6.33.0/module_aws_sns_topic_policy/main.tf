resource "aws_sns_topic_policy" "sns_topic_policies" {
  for_each = var.sns_topic_policies

  arn    = each.value.arn
  policy = each.value.policy
  region = each.value.region
}
