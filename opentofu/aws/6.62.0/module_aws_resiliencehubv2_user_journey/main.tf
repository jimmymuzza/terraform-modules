resource "aws_resiliencehubv2_user_journey" "resiliencehubv2_user_journeys" {
  for_each = var.resiliencehubv2_user_journeys

  name        = each.value.name
  system_arn  = each.value.system_arn
  description = each.value.description
  policy_arn  = each.value.policy_arn
  region      = each.value.region
}
