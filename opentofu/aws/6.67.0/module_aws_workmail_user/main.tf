resource "aws_workmail_user" "workmail_users" {
  for_each = var.workmail_users

  display_name                    = each.value.display_name
  email                           = each.value.email
  name                            = each.value.name
  organization_id                 = each.value.organization_id
  city                            = each.value.city
  company                         = each.value.company
  country                         = each.value.country
  department                      = each.value.department
  first_name                      = each.value.first_name
  hidden_from_global_address_list = each.value.hidden_from_global_address_list
  identity_provider_user_id       = each.value.identity_provider_user_id
  initials                        = each.value.initials
  job_title                       = each.value.job_title
  last_name                       = each.value.last_name
  office                          = each.value.office
  password                        = each.value.password
  region                          = each.value.region
  street                          = each.value.street
  telephone                       = each.value.telephone
  user_role                       = each.value.user_role
  zip_code                        = each.value.zip_code
}
