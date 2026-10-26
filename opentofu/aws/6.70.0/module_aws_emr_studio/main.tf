resource "aws_emr_studio" "emr_studios" {
  for_each = var.emr_studios

  auth_mode                      = each.value.auth_mode
  default_s3_location            = each.value.default_s3_location
  engine_security_group_id       = each.value.engine_security_group_id
  name                           = each.value.name
  service_role                   = each.value.service_role
  subnet_ids                     = each.value.subnet_ids
  vpc_id                         = each.value.vpc_id
  workspace_security_group_id    = each.value.workspace_security_group_id
  description                    = each.value.description
  encryption_key_arn             = each.value.encryption_key_arn
  idp_auth_url                   = each.value.idp_auth_url
  idp_relay_state_parameter_name = each.value.idp_relay_state_parameter_name
  region                         = each.value.region
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
  user_role                      = each.value.user_role
}
