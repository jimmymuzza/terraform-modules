resource "aws_datazone_glossary" "datazone_glossaries" {
  for_each = var.datazone_glossaries

  domain_identifier         = each.value.domain_identifier
  name                      = each.value.name
  owning_project_identifier = each.value.owning_project_identifier
  description               = each.value.description
  region                    = each.value.region
  status                    = each.value.status
}
