resource "aws_macie2_custom_data_identifier" "macie2_custom_data_identifiers" {
  for_each = var.macie2_custom_data_identifiers

  description            = each.value.description
  ignore_words           = each.value.ignore_words
  keywords               = each.value.keywords
  maximum_match_distance = each.value.maximum_match_distance
  name                   = each.value.name
  name_prefix            = each.value.name_prefix
  regex                  = each.value.regex
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
