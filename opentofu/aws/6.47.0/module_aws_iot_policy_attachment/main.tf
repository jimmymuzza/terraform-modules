resource "aws_iot_policy_attachment" "iot_policy_attachments" {
  for_each = var.iot_policy_attachments

  policy = each.value.policy
  target = each.value.target
  region = each.value.region
}
