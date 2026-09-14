resource "aws_connect_phone_number" "connect_phone_numbers" {
  for_each = var.connect_phone_numbers

  country_code = each.value.country_code
  target_arn   = each.value.target_arn
  type         = each.value.type
  description  = each.value.description
  prefix       = each.value.prefix
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
