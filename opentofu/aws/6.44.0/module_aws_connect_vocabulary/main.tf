resource "aws_connect_vocabulary" "connect_vocabularies" {
  for_each = var.connect_vocabularies

  content       = each.value.content
  instance_id   = each.value.instance_id
  language_code = each.value.language_code
  name          = each.value.name
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
