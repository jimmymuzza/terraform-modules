resource "aws_amplify_webhook" "amplify_webhooks" {
  for_each = var.amplify_webhooks

  app_id      = each.value.app_id
  branch_name = each.value.branch_name
  description = each.value.description
  region      = each.value.region
}
