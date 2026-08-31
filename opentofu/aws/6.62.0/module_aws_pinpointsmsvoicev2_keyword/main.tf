resource "aws_pinpointsmsvoicev2_keyword" "pinpointsmsvoicev2_keywords" {
  for_each = var.pinpointsmsvoicev2_keywords

  keyword                  = each.value.keyword
  keyword_message          = each.value.keyword_message
  origination_identity_arn = each.value.origination_identity_arn
  keyword_action           = each.value.keyword_action
  region                   = each.value.region
}
