resource "aws_identitystore_user" "identitystore_users" {
  for_each = var.identitystore_users

  display_name       = each.value.display_name
  identity_store_id  = each.value.identity_store_id
  user_name          = each.value.user_name
  locale             = each.value.locale
  nickname           = each.value.nickname
  preferred_language = each.value.preferred_language
  profile_url        = each.value.profile_url
  region             = each.value.region
  timezone           = each.value.timezone
  title              = each.value.title
  user_type          = each.value.user_type

  dynamic "addresses" {
    for_each = each.value.addresses != null ? each.value.addresses : []
    content {
      country        = addresses.value.country
      formatted      = addresses.value.formatted
      locality       = addresses.value.locality
      postal_code    = addresses.value.postal_code
      primary        = addresses.value.primary
      region         = addresses.value.region
      street_address = addresses.value.street_address
      type           = addresses.value.type
    }
  }

  dynamic "emails" {
    for_each = each.value.emails != null ? each.value.emails : []
    content {
      primary = emails.value.primary
      type    = emails.value.type
      value   = emails.value.value
    }
  }

  dynamic "name" {
    for_each = each.value.name != null ? each.value.name : []
    content {
      family_name      = name.value.family_name
      given_name       = name.value.given_name
      formatted        = name.value.formatted
      honorific_prefix = name.value.honorific_prefix
      honorific_suffix = name.value.honorific_suffix
      middle_name      = name.value.middle_name
    }
  }

  dynamic "phone_numbers" {
    for_each = each.value.phone_numbers != null ? each.value.phone_numbers : []
    content {
      primary = phone_numbers.value.primary
      type    = phone_numbers.value.type
      value   = phone_numbers.value.value
    }
  }
}
