resource "aws_account_primary_contact" "account_primary_contacts" {
  for_each = var.account_primary_contacts

  address_line_1     = each.value.address_line_1
  city               = each.value.city
  country_code       = each.value.country_code
  full_name          = each.value.full_name
  phone_number       = each.value.phone_number
  postal_code        = each.value.postal_code
  account_id         = each.value.account_id
  address_line_2     = each.value.address_line_2
  address_line_3     = each.value.address_line_3
  company_name       = each.value.company_name
  district_or_county = each.value.district_or_county
  state_or_region    = each.value.state_or_region
  website_url        = each.value.website_url
}
