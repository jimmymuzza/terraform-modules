resource "aws_ssmcontacts_contact" "ssmcontacts_contacts" {
  for_each = var.ssmcontacts_contacts

  alias        = each.value.alias
  type         = each.value.type
  display_name = each.value.display_name
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
