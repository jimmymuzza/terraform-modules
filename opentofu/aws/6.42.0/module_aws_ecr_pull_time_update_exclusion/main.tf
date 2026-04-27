resource "aws_ecr_pull_time_update_exclusion" "ecr_pull_time_update_exclusions" {
  for_each = var.ecr_pull_time_update_exclusions

  principal_arn = each.value.principal_arn
  region        = each.value.region
}
