resource "aws_quicksight_key_registration" "quicksight_key_registrations" {
  for_each = var.quicksight_key_registrations

  aws_account_id = each.value.aws_account_id
  region         = each.value.region

  dynamic "key_registration" {
    for_each = each.value.key_registration != null ? each.value.key_registration : []
    content {
      key_arn     = key_registration.value.key_arn
      default_key = key_registration.value.default_key
    }
  }
}
