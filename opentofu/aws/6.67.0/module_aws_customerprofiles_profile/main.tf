resource "aws_customerprofiles_profile" "customerprofiles_profiles" {
  for_each = var.customerprofiles_profiles

  domain_name            = each.value.domain_name
  account_number         = each.value.account_number
  additional_information = each.value.additional_information
  attributes             = each.value.attributes
  birth_date             = each.value.birth_date
  business_email_address = each.value.business_email_address
  business_name          = each.value.business_name
  business_phone_number  = each.value.business_phone_number
  email_address          = each.value.email_address
  first_name             = each.value.first_name
  gender_string          = each.value.gender_string
  home_phone_number      = each.value.home_phone_number
  last_name              = each.value.last_name
  middle_name            = each.value.middle_name
  mobile_phone_number    = each.value.mobile_phone_number
  party_type_string      = each.value.party_type_string
  personal_email_address = each.value.personal_email_address
  phone_number           = each.value.phone_number
  region                 = each.value.region

  dynamic "address" {
    for_each = each.value.address != null ? each.value.address : []
    content {
      address_1   = address.value.address_1
      address_2   = address.value.address_2
      address_3   = address.value.address_3
      address_4   = address.value.address_4
      city        = address.value.city
      country     = address.value.country
      county      = address.value.county
      postal_code = address.value.postal_code
      province    = address.value.province
      state       = address.value.state
    }
  }

  dynamic "billing_address" {
    for_each = each.value.billing_address != null ? each.value.billing_address : []
    content {
      address_1   = billing_address.value.address_1
      address_2   = billing_address.value.address_2
      address_3   = billing_address.value.address_3
      address_4   = billing_address.value.address_4
      city        = billing_address.value.city
      country     = billing_address.value.country
      county      = billing_address.value.county
      postal_code = billing_address.value.postal_code
      province    = billing_address.value.province
      state       = billing_address.value.state
    }
  }

  dynamic "mailing_address" {
    for_each = each.value.mailing_address != null ? each.value.mailing_address : []
    content {
      address_1   = mailing_address.value.address_1
      address_2   = mailing_address.value.address_2
      address_3   = mailing_address.value.address_3
      address_4   = mailing_address.value.address_4
      city        = mailing_address.value.city
      country     = mailing_address.value.country
      county      = mailing_address.value.county
      postal_code = mailing_address.value.postal_code
      province    = mailing_address.value.province
      state       = mailing_address.value.state
    }
  }

  dynamic "shipping_address" {
    for_each = each.value.shipping_address != null ? each.value.shipping_address : []
    content {
      address_1   = shipping_address.value.address_1
      address_2   = shipping_address.value.address_2
      address_3   = shipping_address.value.address_3
      address_4   = shipping_address.value.address_4
      city        = shipping_address.value.city
      country     = shipping_address.value.country
      county      = shipping_address.value.county
      postal_code = shipping_address.value.postal_code
      province    = shipping_address.value.province
      state       = shipping_address.value.state
    }
  }
}
