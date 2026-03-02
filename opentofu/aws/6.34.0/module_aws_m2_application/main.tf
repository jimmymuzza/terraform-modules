resource "aws_m2_application" "m2_applications" {
  for_each = var.m2_applications

  engine_type = each.value.engine_type
  name        = each.value.name
  description = each.value.description
  kms_key_id  = each.value.kms_key_id
  region      = each.value.region
  role_arn    = each.value.role_arn
  tags        = each.value.tags

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {
      content     = definition.value.content
      s3_location = definition.value.s3_location
    }
  }
}
