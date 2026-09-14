resource "aws_servicecatalog_tag_option" "servicecatalog_tag_options" {
  for_each = var.servicecatalog_tag_options

  key    = each.value.key
  value  = each.value.value
  active = each.value.active
  region = each.value.region
}
