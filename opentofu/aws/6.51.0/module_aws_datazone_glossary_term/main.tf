resource "aws_datazone_glossary_term" "datazone_glossary_terms" {
  for_each = var.datazone_glossary_terms

  glossary_identifier = each.value.glossary_identifier
  name                = each.value.name
  domain_identifier   = each.value.domain_identifier
  long_description    = each.value.long_description
  region              = each.value.region
  short_description   = each.value.short_description
  status              = each.value.status

  dynamic "term_relations" {
    for_each = each.value.term_relations != null ? each.value.term_relations : []
    content {
      classifies = term_relations.value.classifies
      is_a       = term_relations.value.is_a
    }
  }
}
