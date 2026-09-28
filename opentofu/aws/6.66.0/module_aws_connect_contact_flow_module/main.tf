resource "aws_connect_contact_flow_module" "connect_contact_flow_modules" {
  for_each = var.connect_contact_flow_modules

  instance_id  = each.value.instance_id
  name         = each.value.name
  content      = each.value.content
  content_hash = each.value.content_hash
  description  = each.value.description
  filename     = each.value.filename
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
