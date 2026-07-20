resource "aws_cognito_user" "cognito_users" {
  for_each = var.cognito_users

  user_pool_id             = each.value.user_pool_id
  username                 = each.value.username
  attributes               = each.value.attributes
  client_metadata          = each.value.client_metadata
  desired_delivery_mediums = each.value.desired_delivery_mediums
  enabled                  = each.value.enabled
  force_alias_creation     = each.value.force_alias_creation
  message_action           = each.value.message_action
  password                 = each.value.password
  region                   = each.value.region
  temporary_password       = each.value.temporary_password
  validation_data          = each.value.validation_data
}
