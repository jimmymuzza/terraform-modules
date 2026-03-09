resource "aws_lex_slot_type" "lex_slot_types" {
  for_each = var.lex_slot_types

  name                     = each.value.name
  create_version           = each.value.create_version
  description              = each.value.description
  region                   = each.value.region
  value_selection_strategy = each.value.value_selection_strategy

  dynamic "enumeration_value" {
    for_each = each.value.enumeration_value != null ? each.value.enumeration_value : []
    content {
      value    = enumeration_value.value.value
      synonyms = enumeration_value.value.synonyms
    }
  }
}
